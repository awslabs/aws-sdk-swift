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

class IMDSCredentialsProviderTests: XCTestCase {
    private let region = "us-west-2"
    private var ec2Client: EC2Client!
    private var iamClient: IAMClient!
    private var stsClient: STSClient!
    private var instanceID: String!

    override func setUp() async throws {
        ec2Client = try EC2Client(region: region)
        iamClient = try IAMClient(region: region)
        stsClient = try STSClient(region: region)
        // Launch an EC2 instance with necessary configs
        try await launchEC2Instance()
        // Wait until instance finishes creating
        
    }

    override func tearDown() async throws {
        // Note - IAM role and docker image are kept for re-use.
        _ = try await ec2Client.terminateInstances(input: TerminateInstancesInput(
            instanceIds: [instanceID]
        ))
    }

    func testIMDSCredentialsProvider() async throws {
        // Check cloud watch logs every 30 seconds pass/fail test accordingly.
        
    }

    // MARK: - HELPER FUNCTIONS

    private func launchEC2Instance() async throws {
        // Create security group to use
        try await createSecurtyGroup()
        // Allow HTTP / HTTPS connections
        try await addInboundRules()
        // Create input for EC2::RunInstances
        let input = createRunInstancesInput()
        let response = try await ec2Client.runInstances(input: input)
        instanceID = response.instances?[0].instanceId
    }

    private func createSecurtyGroup() async throws {
        _ = try await ec2Client.createSecurityGroup(input: CreateSecurityGroupInput(
            description: <#T##String?#>,
            dryRun: <#T##Bool?#>,
            groupName: <#T##String?#>,
            tagSpecifications: <#T##[EC2ClientTypes.TagSpecification]?#>,
            vpcId: <#T##String?#>
        ))
    }

    private func addInboundRules() async throws {
        _ = try await ec2Client.authorizeSecurityGroupIngress(input: AuthorizeSecurityGroupIngressInput(
            cidrIp: <#T##String?#>,
            dryRun: <#T##Bool?#>,
            fromPort: <#T##Int?#>,
            groupId: <#T##String?#>,
            groupName: <#T##String?#>,
            ipPermissions: <#T##[EC2ClientTypes.IpPermission]?#>,
            ipProtocol: <#T##String?#>,
            sourceSecurityGroupName: <#T##String?#>,
            sourceSecurityGroupOwnerId: <#T##String?#>,
            tagSpecifications: <#T##[EC2ClientTypes.TagSpecification]?#>,
            toPort: <#T##Int?#>
        ))
    }

    private func createRunInstancesInput() -> RunInstancesInput {
        let input = RunInstancesInput(
            additionalInfo: <#T##String?#>,
            blockDeviceMappings: <#T##[EC2ClientTypes.BlockDeviceMapping]?#>,
            capacityReservationSpecification: <#T##EC2ClientTypes.CapacityReservationSpecification?#>,
            clientToken: <#T##String?#>,
            cpuOptions: <#T##EC2ClientTypes.CpuOptionsRequest?#>,
            creditSpecification: <#T##EC2ClientTypes.CreditSpecificationRequest?#>,
            disableApiStop: <#T##Bool?#>,
            disableApiTermination: <#T##Bool?#>,
            dryRun: <#T##Bool?#>,
            ebsOptimized: <#T##Bool?#>,
            elasticGpuSpecification: <#T##[EC2ClientTypes.ElasticGpuSpecification]?#>,
            elasticInferenceAccelerators: <#T##[EC2ClientTypes.ElasticInferenceAccelerator]?#>,
            enablePrimaryIpv6: <#T##Bool?#>, enclaveOptions: <#T##EC2ClientTypes.EnclaveOptionsRequest?#>,
            hibernationOptions: <#T##EC2ClientTypes.HibernationOptionsRequest?#>,
            iamInstanceProfile: <#T##EC2ClientTypes.IamInstanceProfileSpecification?#>,
            imageId: <#T##String?#>,
            instanceInitiatedShutdownBehavior: <#T##EC2ClientTypes.ShutdownBehavior?#>,
            instanceMarketOptions: <#T##EC2ClientTypes.InstanceMarketOptionsRequest?#>,
            instanceType: <#T##EC2ClientTypes.InstanceType?#>,
            ipv6AddressCount: <#T##Int?#>,
            ipv6Addresses: <#T##[EC2ClientTypes.InstanceIpv6Address]?#>,
            kernelId: <#T##String?#>,
            keyName: <#T##String?#>,
            launchTemplate: <#T##EC2ClientTypes.LaunchTemplateSpecification?#>,
            licenseSpecifications: <#T##[EC2ClientTypes.LicenseConfigurationRequest]?#>,
            maintenanceOptions: <#T##EC2ClientTypes.InstanceMaintenanceOptionsRequest?#>,
            maxCount: <#T##Int?#>,
            metadataOptions: <#T##EC2ClientTypes.InstanceMetadataOptionsRequest?#>,
            minCount: <#T##Int?#>,
            monitoring: <#T##EC2ClientTypes.RunInstancesMonitoringEnabled?#>,
            networkInterfaces: <#T##[EC2ClientTypes.InstanceNetworkInterfaceSpecification]?#>,
            placement: <#T##EC2ClientTypes.Placement?#>,
            privateDnsNameOptions: <#T##EC2ClientTypes.PrivateDnsNameOptionsRequest?#>,
            privateIpAddress: <#T##String?#>,
            ramdiskId: <#T##String?#>,
            securityGroupIds: <#T##[String]?#>,
            securityGroups: <#T##[String]?#>,
            subnetId: <#T##String?#>,
            tagSpecifications: <#T##[EC2ClientTypes.TagSpecification]?#>,
            userData: <#T##String?#>
        )
        return input
    }
}
