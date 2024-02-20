//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import AWSIAM
import AWSSTS
import AWSCloudWatchLogs
import AWSEC2
import ClientRuntime

class IMDSCredentialsProviderTests: XCTestCase {
    private let region = "us-west-2"
    private var ec2Client: EC2Client!
    private var iamClient: IAMClient!
    private var stsClient: STSClient!
    private var cloudWatchLogClient: CloudWatchLogsClient!
    private var maxWaitEC2InstanceCreation = 1200.0
    private var maxWaitLogGroupCreation = 1200.0
    private var maxWaitLogMessageFound = 600.0

    // MARK: - SETUP & TEARDOWN

    override func setUp() async throws {
        ec2Client = try EC2Client(region: region)
        iamClient = try IAMClient(region: region)
        stsClient = try STSClient(region: region)
        cloudWatchLogClient = try CloudWatchLogsClient(region: region)

        // Launch the EC2 instance with necessary configs.
        try await launchEC2Instance()
        // Wait until instance is running.
        _ = try await ec2Client.waitUntilInstanceRunning(
            options: WaiterOptions(maxWaitTime: maxWaitEC2InstanceCreation),
            input: DescribeInstancesInput(instanceIds: [ec2InstanceID])
        )
        // Wait until cloud watch log group is created by shell script passed to EC2 instance at launch.
        try await setUpCloudWatchLogs()
    }

    // Note: IAM role and docker image in ECR private repo are kept for re-use.
    override func tearDown() async throws {
        // Delete EC2 instance
        _ = try await ec2Client.terminateInstances(input: TerminateInstancesInput(
            instanceIds: [ec2InstanceID]
        ))
        // Delete cloud watch log group created for EC2 instance.
        _ = try await cloudWatchLogClient.deleteLogGroup(
            input: DeleteLogGroupInput(logGroupName: cloudWatchLogGroupName)
        )
    }

    // MARK: - TEST CASE

    func testIMDSCredentialsProvider() async throws {
        // Check CloudWatch logs for success / failure log and pass / fail the test accordingly.
        var (statusLogFound, logsContainSuccessKeyword, logsContainFailureKeyword) = (false, false, false)
        // Timer for waiting test app completion
        let statusLogTimeLimitFlag = TimeLimitFlagActor()
        let statusLogTimer = getTimer(
            maxWait: maxWaitLogMessageFound,
            timeLimitFlag: statusLogTimeLimitFlag
        )
        while (!(await statusLogTimeLimitFlag.timeLimitExceeded) && !statusLogFound) {
            logsContainSuccessKeyword = try await checkLogsForKeyword(keyword: "imds-integration-test-success")
            logsContainFailureKeyword = try await checkLogsForKeyword(keyword: "imds-integration-test-failure")
            statusLogFound = logsContainSuccessKeyword || logsContainFailureKeyword
            if statusLogFound {
                // Kill timer if log message is found within time limit.
                statusLogTimer.invalidate()
            }
        }
        XCTAssertTrue(
            logsContainSuccessKeyword,
            "Logs did not contain the expected success keyword. Test failed!"
        )
    }

    // MARK: - HELPER ACTOR & ERRORS

    actor TimeLimitFlagActor {
        var timeLimitExceeded = false

        func setLimitExceeded() {
            timeLimitExceeded = true
        }
    }

    private func getTimer(maxWait: Double, timeLimitFlag: TimeLimitFlagActor) -> Timer {
        return Timer.scheduledTimer(withTimeInterval: maxWait, repeats: false) { timer in
            Task {
                await timeLimitFlag.setLimitExceeded()
            }
            // Kill timer if time limit reached.
            timer.invalidate()
        }
    }

    private enum IMDSError: Error {
        case logGroupCreationFailed(String)
    }

    // MARK: - HELPER FUNCTIONS

    private var ec2InstanceID: String!
    private var securityGroupID: String!
    private let securityGroupName = "imds-integ-test-security-group"
    private var instanceProfileARN: String!
    private let instanceProfileName = "imds-integ-test-instance-profile"
    private var roleARN: String!
    private let roleName = "imds-integ-test-role"
    private let accessPolicyName = "imds-integ-test-access-policy"
    private var al2AMIID: String!
    private var accountID: String!
    private var ecrRepoURL: String!
    private let dockerImageName = "imds-integ-test:latest"
    private let cloudWatchLogGroupName = "imds-log-group"
    private let cloudWatchLogStreamName = "imds-log-stream"

    private func launchEC2Instance() async throws {
        // Create role & create instance profile using that role
        try await createInstanceProfile()
        // Create security group to use
        try await createSecurtyGroup()
        // Allow HTTP / HTTPS connections
        try await addIngressRulesToSecurityGroup()
        // Get newest Amazon Linux 2 AMI to use
        al2AMIID = try await getAL2AMIID()
        // Create input for EC2::RunInstances
        let input = try await createRunInstancesInput()
        // Launch EC2 instance
        let response = try await ec2Client.runInstances(input: input)
        ec2InstanceID = response.instances?[0].instanceId
    }

    private func createInstanceProfile() async throws {
        // Policy documents
        let assumeRolePolicy = """
        { "Version": "2012-10-17", "Statement": [ { 
        "Effect": "Allow",
        "Principal": { "Service": "ec2.amazonaws.com" },
        "Action": "sts:AssumeRole" } ] }
        """
        let accessPolicy = """
        { "Version": "2012-10-17", "Statement": [ {
        "Effect": "Allow",
        "Action": [ "sts:GetCallerIdentity",
                    "ecr:GetAuthorizationToken",
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:DescribeLogStreams",
                    "logs:PutLogEvents" ],
        "Resource": ["*"] } ] }
        """
        // Create role
        roleARN = try await iamClient.createRole(input: CreateRoleInput(
            assumeRolePolicyDocument: assumeRolePolicy,
            roleName: roleName
        )).role?.arn
        // Add in-line access policy to role
        _ = try await iamClient.putRolePolicy(input: PutRolePolicyInput(
            policyDocument: accessPolicy,
            policyName: accessPolicyName,
            roleName: roleName
        ))
        // Create instance profile
        instanceProfileARN = try await iamClient.createInstanceProfile(input: CreateInstanceProfileInput(
            instanceProfileName: instanceProfileName
        )).instanceProfile?.arn
        // Configure instance profile with role
        _ = try await iamClient.addRoleToInstanceProfile(input: AddRoleToInstanceProfileInput(
            instanceProfileName: instanceProfileName,
            roleName: roleName
        ))
    }

    private func createSecurtyGroup() async throws {
        securityGroupID = try await ec2Client.createSecurityGroup(input: CreateSecurityGroupInput(
            description: "Security group used for IMDS credentials provider integration test.",
            groupName: securityGroupName
        )).groupId
    }

    private func addIngressRulesToSecurityGroup() async throws {
        _ = try await ec2Client.authorizeSecurityGroupIngress(input: AuthorizeSecurityGroupIngressInput(
            groupId: securityGroupID,
            ipPermissions: [
                EC2ClientTypes.IpPermission(
                    fromPort: 80,
                    ipProtocol: "tcp",
                    ipRanges: [EC2ClientTypes.IpRange(cidrIp: "0.0.0.0/0", description: "All HTTP")],
                    toPort: 80
                ),
                EC2ClientTypes.IpPermission(
                    fromPort: 443,
                    ipProtocol: "tcp",
                    ipRanges: [EC2ClientTypes.IpRange(cidrIp: "0.0.0.0/0", description: "All HTTPS")],
                    toPort: 443
                )
            ]
        ))
    }

    private func getAL2AMIID() async throws -> String? {
        return try await ec2Client.describeImages(input: DescribeImagesInput(
            filters: [
                EC2ClientTypes.Filter(name: "description", values: ["*Amazon Linux 2*"]),
                EC2ClientTypes.Filter(name: "architecture", values: ["x86_64"]),
                EC2ClientTypes.Filter(name: "image-type", values: ["machine"]),
                EC2ClientTypes.Filter(name: "is-public", values: ["true"]),
                EC2ClientTypes.Filter(name: "state", values: ["available"])
            ],
            owners: ["amazon"]
        )).images?[0].imageId
    }

    private func createRunInstancesInput() async throws -> RunInstancesInput {
        accountID = try await stsClient.getCallerIdentity(input: GetCallerIdentityInput()).account
        ecrRepoURL = "\(accountID).dkr.ecr.\(region).amazonaws.com"

        let userDataScriptEncoded = """
        #!/bin/bash
        sudo yum update -y
        sudo yum install docker -y
        sudo systemctl start docker
        sudo systemctl start awslogsd
        aws ecr get-login-password --region \(region) \
        | docker login --username AWS --password-stdin \(ecrRepoURL)
        sudo docker pull \(ecrRepoURL)/\(dockerImageName)
        sudo docker run \
        --log-driver=awslogs \
        --log-opt awslogs-region=us-west-2 \
        --log-opt awslogs-group=\(cloudWatchLogGroupName) \
        --log-opt awslogs-stream=\(cloudWatchLogStreamName) \
        --log-opt awslogs-create-group=true
        \(ecrRepoURL)/\(dockerImageName)
        """.data(using: .utf8)?.base64EncodedString()

        let input = RunInstancesInput(
            iamInstanceProfile: EC2ClientTypes.IamInstanceProfileSpecification(
                name: instanceProfileName
            ),
            imageId: al2AMIID,
            maxCount: 1,
            // Hop limit must be 2 for containerized application in EC2 instance to reach IMDS.
            metadataOptions: EC2ClientTypes.InstanceMetadataOptionsRequest(httpPutResponseHopLimit: 2),
            minCount: 1,
            securityGroups: [securityGroupName],
            // A bash script that sets up docker and runs it is passed as user-data.
            userData: userDataScriptEncoded
        )
        return input
    }

    private func setUpCloudWatchLogs() async throws {
        let logGroupCreationTimeLimitFlag = TimeLimitFlagActor()
        let logGroupCreationTimer = getTimer(
            maxWait: maxWaitLogGroupCreation,
            timeLimitFlag: logGroupCreationTimeLimitFlag
        )
        var logGroupInitialized = false
        while (!(await logGroupCreationTimeLimitFlag.timeLimitExceeded) && !logGroupInitialized) {
            // Check if log groups exists.
            let logGroups = try await cloudWatchLogClient.describeLogGroups(
                input: DescribeLogGroupsInput()
            ).logGroups
            if let logGroups, logGroups.contains(where: { $0.logGroupName == cloudWatchLogGroupName }) {
                logGroupInitialized = true
                // Kill timer if log group is created within time limit.
                logGroupCreationTimer.invalidate()
            }
        }
        // Throw if no log group was found within the time limit.
        if (!logGroupInitialized) {
            throw IMDSError.logGroupCreationFailed("No log group for the integration test was found.")
        }
    }

    // Checks cloud watch logs for a keyword string.
    private func checkLogsForKeyword(keyword: String) async throws -> Bool {
        let logStreamsResp = try await cloudWatchLogClient.describeLogStreams(input: DescribeLogStreamsInput(
            descending: true,
            logGroupName: cloudWatchLogGroupName,
            orderBy: .lasteventtime
        ))
        if let logStreamName = logStreamsResp.logStreams?.first?.logStreamName,
            logStreamName == cloudWatchLogStreamName {
            let logEventsResp = try await cloudWatchLogClient.getLogEvents(input: GetLogEventsInput(
                logGroupName: cloudWatchLogGroupName,
                logStreamName: cloudWatchLogStreamName
            ))
            for event in logEventsResp.events ?? [] {
                if let message = event.message, message.contains(keyword) {
                    return true
                }
            }
        }
        return false
    }
}

private extension String.StringInterpolation {
    /// Prints `Optional` values by only interpolating it if the value is set. `nil` is used as a fallback value to provide a clear output.
    mutating func appendInterpolation<T: CustomStringConvertible>(_ value: T?) {
        appendInterpolation(value ?? "nil" as CustomStringConvertible)
    }
}
