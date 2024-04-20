//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct Route53TrimHostedZoneMiddleware<Input, Output>: ClientRuntime.Middleware {
    public let id: Swift.String = "Route53TrimHostedZoneMiddleware"
    private let prefixes = ["/hostedzone/", "hostedzone/", "/hostedzone", "hostedzone"]

    private let hostedZoneIDKeyPath: WritableKeyPath<Input, String?>

    public init(_ hostedZoneIDKeyPath: WritableKeyPath<Input, String?>) {
        self.hostedZoneIDKeyPath = hostedZoneIDKeyPath
    }

    public func handle<H>(context: Context,
                  input: Input,
                  next: H) async throws -> ClientRuntime.OperationOutput<Output>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context
    {
        guard let hostedZoneId = input[keyPath: hostedZoneIDKeyPath] else {
            return try await next.handle(context: context, input: input)
        }
        var copiedInput = input
        let stripped = hostedZoneId.stripFirstMatching(prefixes: prefixes)
        copiedInput[keyPath: hostedZoneIDKeyPath] = stripped
        return try await next.handle(context: context, input: copiedInput)
    }

    public typealias MInput = Input
    public typealias MOutput = ClientRuntime.OperationOutput<Output>
    public typealias Context = ClientRuntime.HttpContext
}
