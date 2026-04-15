//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSSDKHTTPAuth
import XCTest
import AWSEventBridge
import ClientRuntime
import AWSClientRuntime
import AWSRoute53

/// Tests SigV4a signing flow using EventBridge's global endpoint.
class EventBridgeSigV4ATests: XCTestCase {
    // The custom event bridge client with only sigv4a auth scheme configured (w/o SigV4)
    private var sigv4aEventBridgeClient: EventBridgeClient!
    // The primary event bridge client used to create an event bus in primary region
    private var primaryRegionEventBridgeClient: EventBridgeClient!
    // The secondary event bridge client used to create an event bus in secondary region
    private var secondaryRegionEventBridgeClient: EventBridgeClient!
    // The Route 53 client used to create a healthcheck, a parameter to EventBridge::createEndpoint
    private var route53Client: Route53Client!

    private var eventBridgeConfig: EventBridgeClient.EventBridgeClientConfig!
    private let primaryRegion = "us-west-2"
    private let secondaryRegion = "us-east-1"

    // Name for the EventBridge global endpoint
    private let endpointName = "sigv4a-test-global-endpoint-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private let eventBusName = "sigv4a-integ-test-eventbus-\(UUID().uuidString.split(separator: "-").first!.lowercased())"
    private var endpointId: String!

    private var healthCheckId: String!
    private let route53HealthCheckArnPrefix = "arn:aws:route53:::healthcheck/"

    private let NSEC_PER_SEC = 1_000_000_000

    override func setUp() async throws {
        // Create the clients
        primaryRegionEventBridgeClient = try EventBridgeClient(region: primaryRegion)
        secondaryRegionEventBridgeClient = try EventBridgeClient(region: secondaryRegion)

        eventBridgeConfig = try await EventBridgeClient.EventBridgeClientConfig(region: primaryRegion)
        eventBridgeConfig.authSchemes = [SigV4AAuthScheme()]
        sigv4aEventBridgeClient = EventBridgeClient(config: eventBridgeConfig)

        route53Client = try Route53Client(region: secondaryRegion)

        // Create two event buses with identical names but in two different regions for the global endpoint
        let eventBusArn1 = try await primaryRegionEventBridgeClient.createEventBus(input: CreateEventBusInput(name: eventBusName)).eventBusArn
        let eventBusArn2 = try await secondaryRegionEventBridgeClient.createEventBus(input: CreateEventBusInput(name: eventBusName)).eventBusArn

        // Create Route 53 Healthcheck
        let healthCheckConfig = Route53ClientTypes.HealthCheckConfig(
            fullyQualifiedDomainName: "www.amazon.com",
            type: .https
        )
        let createHealthCheckInput = CreateHealthCheckInput(
            callerReference: UUID().uuidString.split(separator: "-").first!.lowercased(),
            healthCheckConfig: healthCheckConfig
        )
        let healthCheck = try await route53Client.createHealthCheck(input: createHealthCheckInput)
        healthCheckId = (healthCheck.healthCheck?.id)!
        let healthCheckArn = route53HealthCheckArnPrefix + healthCheckId

        // Construct routingConfig object to use for global endpoint creation
        let primary = EventBridgeClientTypes.Primary(healthCheck: healthCheckArn)
        let secondary = EventBridgeClientTypes.Secondary(route: secondaryRegion)
        let failoverConfig = EventBridgeClientTypes.FailoverConfig(primary: primary, secondary: secondary)
        let routingConfig = EventBridgeClientTypes.RoutingConfig(failoverConfig: failoverConfig)

        // Construct replicationConfig object to use for global endpoint creation
        let replicationState = EventBridgeClientTypes.ReplicationState.disabled
        let replicationConfig = EventBridgeClientTypes.ReplicationConfig(state: replicationState)

        // Create the global endpoint with the two endpoint event buses and the routing config (healthcheck).
        let endpointEventBus1 = EventBridgeClientTypes.EndpointEventBus(eventBusArn: eventBusArn1)
        let endpointEventBus2 = EventBridgeClientTypes.EndpointEventBus(eventBusArn: eventBusArn2)
        _ = try await primaryRegionEventBridgeClient.createEndpoint(input: CreateEndpointInput(
            eventBuses: [endpointEventBus1, endpointEventBus2],
            name: endpointName,
            replicationConfig: replicationConfig,
            routingConfig: routingConfig
        ))

        // Pause program execution briefly.
        // This is needed bc it takes some time for newly created global endpoint to resolve in DNS
        // Additional time will be taken, if needed, in retry w/ exponential backoff below
        let seconds = 20.0
        try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))

        // Retry getting endpointId with exponential backoff to ensure it's properly set
        var retrievedEndpointId: String?
        for attempt in 0..<3 {
            retrievedEndpointId = try await primaryRegionEventBridgeClient.describeEndpoint(input: DescribeEndpointInput(name: endpointName)).endpointId
            if retrievedEndpointId != nil {
                break
            }
            // Retry delays are 2, 4, 8 secs for 1st, 2nd, 3rd retry respectively
            let delay = 2 * UInt64(1 << attempt)
            try await Task.sleep(nanoseconds: delay * UInt64(NSEC_PER_SEC))
        }

        // Fail test setup if endpointId is not set after all retries
        endpointId = try XCTUnwrap(retrievedEndpointId, "describeEndpoint exhausted its retries")
    }

    override func tearDown() async throws {
        // Delete the endpoint
        _ = try await primaryRegionEventBridgeClient.deleteEndpoint(input: DeleteEndpointInput(name: endpointName))
        // Delete the event buses
        _ = try await primaryRegionEventBridgeClient.deleteEventBus(input: DeleteEventBusInput(name: eventBusName))
        _ = try await secondaryRegionEventBridgeClient.deleteEventBus(input: DeleteEventBusInput(name: eventBusName))
        // Delete the Route 53 Healthcheck
        _ = try await route53Client.deleteHealthCheck(input: DeleteHealthCheckInput(healthCheckId: healthCheckId))
    }

    func testEventBridgeSigV4A() async throws {
        // Ensure endpointId is set before proceeding
        let unwrappedEndpointId = try XCTUnwrap(endpointId, "endpointId should be set in setUp")

        // Call putEvents with EventBridge client that only has SigV4a auth scheme configured
        let event = EventBridgeClientTypes.PutEventsRequestEntry(
            detail: "{}",
            detailType: "test",
            eventBusName: eventBusName,
            source: "test"
        )

        // Make multiple attempts with exponential backoff to call PutEvents.  Retry/log on any error.
        // Retry delays are on top of the wait already performed above.
        // The host used by this call is a custom host, which sometimes takes a few seconds
        // after creation for DNS to resolve it successfully.
        let input = PutEventsInput(endpointId: unwrappedEndpointId, entries: [event])
        var output: PutEventsOutput?
        for attempt in 0..<3 {
            do {
                output = try await sigv4aEventBridgeClient.putEvents(input: input)
                break
            } catch {
                print("Attempt \(attempt) failed: \(error)")
                // Retry delays are 2, 4, 8 secs for 1st, 2nd, 3rd retry respectively
                let delay = 2 * UInt64(1 << attempt)
                try await Task.sleep(nanoseconds: delay * UInt64(NSEC_PER_SEC))
            }
        }

        // Get the failed entry count & check that it's zero.
        // If output is nil then retries were exhausted above.
        let failedEntryCount = try XCTUnwrap(output?.failedEntryCount, "putEvents exhausted its retries")
        XCTAssertEqual(failedEntryCount, 0)
    }
}
