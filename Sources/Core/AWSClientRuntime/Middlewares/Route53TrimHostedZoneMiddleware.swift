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
    Self.Context == H.Context {
        let updatedInput = getUpdatedInput(input: input)
        return try await next.handle(context: context, input: updatedInput)
    }

    private func getUpdatedInput(input: Input) -> Input {
        guard let hostedZoneId = input[keyPath: hostedZoneIDKeyPath] else {
            return input
        }
        var copiedInput = input
        let stripped = hostedZoneId.stripFirstMatching(prefixes: prefixes)
        copiedInput[keyPath: hostedZoneIDKeyPath] = stripped
        return copiedInput
    }

    public typealias MInput = Input
    public typealias MOutput = ClientRuntime.OperationOutput<Output>
    public typealias Context = ClientRuntime.HttpContext
}

extension Route53TrimHostedZoneMiddleware: HttpInterceptor {
    public typealias InputType = Input
    public typealias OutputType = Output

    public func modifyBeforeSerialization(
        context: some MutableInput<Self.InputType, Self.AttributesType>
    ) async throws {
        context.updateInput(updated: getUpdatedInput(input: context.getInput()))
    }
}
