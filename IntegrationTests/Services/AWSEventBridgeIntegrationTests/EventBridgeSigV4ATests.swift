//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSEventBridge
import ClientRuntime
import AWSClientRuntime
import AWSRoute53

/// Tests SigV4a signing flow using EventBridge::describeConnection
class EventBridgeSigV4ATests: XCTestCase {
    private var sigv4aEventBridgeClient: EventBridgeClient!
    private var regularEventBridgeClient: EventBridgeClient!
    private var secondaryRegionEventBridgeClient: EventBridgeClient!
    private var route53Client: Route53Client!

    private var eventBridgeConfig: EventBridgeClient.EventBridgeClientConfiguration!
    private let region = "us-west-2"
    private let secondaryRegion = "us-east-1"

    private let endpointName = "sigv4a-test-global-endpoint"
    private let eventBusName = "sigv4a-integ-test-eventbus"
    private var endpointId: String!

    private var healthCheckId: String!
    private let route53HealthCheckArnPrefix = "arn:aws:route53:::healthcheck/"

    override func setUp() async throws {
        // Create regular event bridge client
        regularEventBridgeClient = try EventBridgeClient(region: region)
        // Create event bridge client with only sigv4a auth scheme
        eventBridgeConfig = try await EventBridgeClient.EventBridgeClientConfiguration(region: region)
        eventBridgeConfig.authSchemes = [SigV4AAuthScheme()]
        sigv4aEventBridgeClient = EventBridgeClient(config: eventBridgeConfig)
        // Create secondary region EventBridge client used to create second event bus
        // in secondary region, used when creating global endpoint
        secondaryRegionEventBridgeClient = try EventBridgeClient(region: secondaryRegion)
        // Create Route 53 client
        route53Client = try Route53Client(region: "us-east-1")

        // Create two event buses with identical names to be used in two different regions for the global endpoint
        let eventBusArn1 = try await regularEventBridgeClient.createEventBus(input: CreateEventBusInput(name: eventBusName)).eventBusArn
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

        // Create the endpoint with the two endpoint event buses and the routing config (healthcheck).
        let endpointEventBus1 = EventBridgeClientTypes.EndpointEventBus(eventBusArn: eventBusArn1)
        let endpointEventBus2 = EventBridgeClientTypes.EndpointEventBus(eventBusArn: eventBusArn2)
        _ = try await regularEventBridgeClient.createEndpoint(input: CreateEndpointInput(
            eventBuses: [endpointEventBus1, endpointEventBus2],
            name: endpointName,
            replicationConfig: replicationConfig,
            routingConfig: routingConfig
        ))

        // Wait until global endpoint is active before trying to fetch endpoint ID
        let seconds = 4.0
        try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
        
        // Store the endpoint Id of the global endpoint just created
        let endpointTemp = try await regularEventBridgeClient.describeEndpoint(input: DescribeEndpointInput(name: endpointName))
        endpointId = endpointTemp.endpointId
    }

    override func tearDown() async throws {
        // Delete the endpoint
        _ = try await regularEventBridgeClient.deleteEndpoint(input: DeleteEndpointInput(name: endpointName))
        // Delete the event buses
        _ = try await regularEventBridgeClient.deleteEventBus(input: DeleteEventBusInput(name: eventBusName))
        _ = try await secondaryRegionEventBridgeClient.deleteEventBus(input: DeleteEventBusInput(name: eventBusName))
        // Delete the Route 53 Healthcheck
        _ = try await route53Client.deleteHealthCheck(input: DeleteHealthCheckInput(healthCheckId: healthCheckId))
    }

    func testEventBridgeSigV4A() async throws {
        // Call putEvents with EventBridge client that only has SigV4a auth scheme configured
        let event = EventBridgeClientTypes.PutEventsRequestEntry(eventBusName: eventBusName)
        let response = try await sigv4aEventBridgeClient.putEvents(input: PutEventsInput(
            endpointId: endpointId,
            entries: [event]
        ))
        // Confirm that request was sent with SigV4A authorization: AWS4-ECDSA-P256-SHA256 Credential=...
        // ANd not the SigV4 authorization: AWS4-HMAC-SHA256 Credential=...
        
        // Confirm that returned response has 0 failed entries
        let count = response.failedEntryCount
        XCTAssertNotNil(count == 0)
    }
}
