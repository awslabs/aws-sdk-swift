//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSRoute53

class AWSRoute53Tests: XCTestCase {
    var client: Route53Client!
    var id: String?

    override func setUp() async throws {
        try await super.setUp()
        client = try Route53Client(region: "us-east-1")
    }
    override func tearDown() async throws {
        let input = DeleteHostedZoneInput(id: id)
        _ = try await client.deleteHostedZone(input: input)
    }

    func test_route53_createsAndDeletesZoneAndRecords() async throws {
        let ref = UUID().uuidString
        let hostedZoneName = "\(ref).com."

        let input0 = CreateHostedZoneInput(callerReference: ref, name: hostedZoneName)
        let output0 = try await client.createHostedZone(input: input0)
        id = output0.hostedZone?.id

        let createBatch = Route53ClientTypes.ChangeBatch(changes:
            [
                Route53ClientTypes.Change(
                    action: .create,
                    resourceRecordSet: Route53ClientTypes.ResourceRecordSet(
                        name: "abc.\(hostedZoneName)", resourceRecords: [Route53ClientTypes.ResourceRecord(value: "1.1.1.1")], ttl: 3600, type: .a
                    )
                ),
            ]
        )
        let input1 = ChangeResourceRecordSetsInput(changeBatch: createBatch, hostedZoneId: id)
        let output1 = try await client.changeResourceRecordSets(input: input1)

        let deleteBatch = Route53ClientTypes.ChangeBatch(changes:
            [
                Route53ClientTypes.Change(
                    action: .delete,
                    resourceRecordSet: Route53ClientTypes.ResourceRecordSet(
                        name: "abc.\(hostedZoneName)", resourceRecords: [Route53ClientTypes.ResourceRecord(value: "1.1.1.1")], ttl: 3600, type: .a
                    )
                ),
            ]
        )
        let input2 = ChangeResourceRecordSetsInput(changeBatch: deleteBatch, hostedZoneId: id)
        let output2 = try await client.changeResourceRecordSets(input: input2)
    }
}
