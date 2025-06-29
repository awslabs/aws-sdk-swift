//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(SmithyReadWrite) import ClientRuntime
import class SmithyHTTPAPI.HTTPResponse
@_spi(SmithyReadWrite) import class SmithyJSON.Reader
@_spi(SmithyReadWrite) import class SmithyJSON.Writer
import enum ClientRuntime.ErrorFault
import enum SmithyReadWrite.ReaderError
import protocol AWSClientRuntime.AWSServiceError
import protocol ClientRuntime.HTTPError
import protocol ClientRuntime.ModeledError
@_spi(SmithyReadWrite) import protocol SmithyReadWrite.SmithyReader
@_spi(SmithyReadWrite) import protocol SmithyReadWrite.SmithyWriter
@_spi(SmithyReadWrite) import struct AWSClientRuntime.RestJSONError
@_spi(UnknownAWSHTTPServiceError) import struct AWSClientRuntime.UnknownAWSHTTPServiceError
import struct Smithy.Document

/// You do not have sufficient access to perform this action.
public struct AccessDeniedException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error, Swift.Sendable {

    public struct Properties: Swift.Sendable {
        /// This member is required.
        public internal(set) var message: Swift.String? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "AccessDeniedException" }
    public static var fault: ClientRuntime.ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = SmithyHTTPAPI.HTTPResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil
    ) {
        self.properties.message = message
    }
}

extension InspectorScanClientTypes {

    public enum InternalServerExceptionReason: Swift.Sendable, Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Hashable {
        case failedToGenerateSbom
        case other
        case sdkUnknown(Swift.String)

        public static var allCases: [InternalServerExceptionReason] {
            return [
                .failedToGenerateSbom,
                .other
            ]
        }

        public init?(rawValue: Swift.String) {
            let value = Self.allCases.first(where: { $0.rawValue == rawValue })
            self = value ?? Self.sdkUnknown(rawValue)
        }

        public var rawValue: Swift.String {
            switch self {
            case .failedToGenerateSbom: return "FAILED_TO_GENERATE_SBOM"
            case .other: return "OTHER"
            case let .sdkUnknown(s): return s
            }
        }
    }
}

/// The request processing has failed because of an unknown error, exception or failure.
public struct InternalServerException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error, Swift.Sendable {

    public struct Properties: Swift.Sendable {
        /// This member is required.
        public internal(set) var message: Swift.String? = nil
        /// The reason for the validation failure.
        /// This member is required.
        public internal(set) var reason: InspectorScanClientTypes.InternalServerExceptionReason? = nil
        /// The number of seconds to wait before retrying the request.
        public internal(set) var retryAfterSeconds: Swift.Int? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "InternalServerException" }
    public static var fault: ClientRuntime.ErrorFault { .server }
    public static var isRetryable: Swift.Bool { true }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = SmithyHTTPAPI.HTTPResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil,
        reason: InspectorScanClientTypes.InternalServerExceptionReason? = nil,
        retryAfterSeconds: Swift.Int? = nil
    ) {
        self.properties.message = message
        self.properties.reason = reason
        self.properties.retryAfterSeconds = retryAfterSeconds
    }
}

/// The request was denied due to request throttling.
public struct ThrottlingException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error, Swift.Sendable {

    public struct Properties: Swift.Sendable {
        /// This member is required.
        public internal(set) var message: Swift.String? = nil
        /// The number of seconds to wait before retrying the request.
        public internal(set) var retryAfterSeconds: Swift.Int? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "ThrottlingException" }
    public static var fault: ClientRuntime.ErrorFault { .client }
    public static var isRetryable: Swift.Bool { true }
    public static var isThrottling: Swift.Bool { true }
    public internal(set) var httpResponse = SmithyHTTPAPI.HTTPResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        message: Swift.String? = nil,
        retryAfterSeconds: Swift.Int? = nil
    ) {
        self.properties.message = message
        self.properties.retryAfterSeconds = retryAfterSeconds
    }
}

extension InspectorScanClientTypes {

    /// The request has failed validation due to missing required fields or having invalid inputs.
    public struct ValidationExceptionField: Swift.Sendable {
        /// The validation exception message.
        /// This member is required.
        public var message: Swift.String?
        /// The name of the validation exception.
        /// This member is required.
        public var name: Swift.String?

        public init(
            message: Swift.String? = nil,
            name: Swift.String? = nil
        ) {
            self.message = message
            self.name = name
        }
    }
}

extension InspectorScanClientTypes {

    public enum ValidationExceptionReason: Swift.Sendable, Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Hashable {
        case cannotParse
        case fieldValidationFailed
        case other
        case unknownOperation
        case unsupportedSbomType
        case sdkUnknown(Swift.String)

        public static var allCases: [ValidationExceptionReason] {
            return [
                .cannotParse,
                .fieldValidationFailed,
                .other,
                .unknownOperation,
                .unsupportedSbomType
            ]
        }

        public init?(rawValue: Swift.String) {
            let value = Self.allCases.first(where: { $0.rawValue == rawValue })
            self = value ?? Self.sdkUnknown(rawValue)
        }

        public var rawValue: Swift.String {
            switch self {
            case .cannotParse: return "CANNOT_PARSE"
            case .fieldValidationFailed: return "FIELD_VALIDATION_FAILED"
            case .other: return "OTHER"
            case .unknownOperation: return "UNKNOWN_OPERATION"
            case .unsupportedSbomType: return "UNSUPPORTED_SBOM_TYPE"
            case let .sdkUnknown(s): return s
            }
        }
    }
}

/// The request has failed validation due to missing required fields or having invalid inputs.
public struct ValidationException: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error, Swift.Sendable {

    public struct Properties: Swift.Sendable {
        /// The fields that failed validation.
        public internal(set) var fields: [InspectorScanClientTypes.ValidationExceptionField]? = nil
        /// This member is required.
        public internal(set) var message: Swift.String? = nil
        /// The reason for the validation failure.
        /// This member is required.
        public internal(set) var reason: InspectorScanClientTypes.ValidationExceptionReason? = nil
    }

    public internal(set) var properties = Properties()
    public static var typeName: Swift.String { "ValidationException" }
    public static var fault: ClientRuntime.ErrorFault { .client }
    public static var isRetryable: Swift.Bool { false }
    public static var isThrottling: Swift.Bool { false }
    public internal(set) var httpResponse = SmithyHTTPAPI.HTTPResponse()
    public internal(set) var message: Swift.String?
    public internal(set) var requestID: Swift.String?

    public init(
        fields: [InspectorScanClientTypes.ValidationExceptionField]? = nil,
        message: Swift.String? = nil,
        reason: InspectorScanClientTypes.ValidationExceptionReason? = nil
    ) {
        self.properties.fields = fields
        self.properties.message = message
        self.properties.reason = reason
    }
}

extension InspectorScanClientTypes {

    public enum OutputFormat: Swift.Sendable, Swift.Equatable, Swift.RawRepresentable, Swift.CaseIterable, Swift.Hashable {
        case cycloneDx15
        case inspector
        case sdkUnknown(Swift.String)

        public static var allCases: [OutputFormat] {
            return [
                .cycloneDx15,
                .inspector
            ]
        }

        public init?(rawValue: Swift.String) {
            let value = Self.allCases.first(where: { $0.rawValue == rawValue })
            self = value ?? Self.sdkUnknown(rawValue)
        }

        public var rawValue: Swift.String {
            switch self {
            case .cycloneDx15: return "CYCLONE_DX_1_5"
            case .inspector: return "INSPECTOR"
            case let .sdkUnknown(s): return s
            }
        }
    }
}

public struct ScanSbomInput: Swift.Sendable {
    /// The output format for the vulnerability report.
    public var outputFormat: InspectorScanClientTypes.OutputFormat?
    /// The JSON file for the SBOM you want to scan. The SBOM must be in CycloneDX 1.5 format.
    /// This member is required.
    public var sbom: Smithy.Document?

    public init(
        outputFormat: InspectorScanClientTypes.OutputFormat? = nil,
        sbom: Smithy.Document? = nil
    ) {
        self.outputFormat = outputFormat
        self.sbom = sbom
    }
}

public struct ScanSbomOutput: Swift.Sendable {
    /// The vulnerability report for the scanned SBOM.
    public var sbom: Smithy.Document?

    public init(
        sbom: Smithy.Document? = nil
    ) {
        self.sbom = sbom
    }
}

extension ScanSbomInput {

    static func urlPathProvider(_ value: ScanSbomInput) -> Swift.String? {
        return "/scan/sbom"
    }
}

extension ScanSbomInput {

    static func write(value: ScanSbomInput?, to writer: SmithyJSON.Writer) throws {
        guard let value else { return }
        try writer["outputFormat"].write(value.outputFormat)
        try writer["sbom"].write(value.sbom)
    }
}

extension ScanSbomOutput {

    static func httpOutput(from httpResponse: SmithyHTTPAPI.HTTPResponse) async throws -> ScanSbomOutput {
        let data = try await httpResponse.data()
        let responseReader = try SmithyJSON.Reader.from(data: data)
        let reader = responseReader
        var value = ScanSbomOutput()
        value.sbom = try reader["sbom"].readIfPresent()
        return value
    }
}

enum ScanSbomOutputError {

    static func httpError(from httpResponse: SmithyHTTPAPI.HTTPResponse) async throws -> Swift.Error {
        let data = try await httpResponse.data()
        let responseReader = try SmithyJSON.Reader.from(data: data)
        let baseError = try AWSClientRuntime.RestJSONError(httpResponse: httpResponse, responseReader: responseReader, noErrorWrapping: false)
        if let error = baseError.customError() { return error }
        switch baseError.code {
            case "AccessDeniedException": return try AccessDeniedException.makeError(baseError: baseError)
            case "InternalServerException": return try InternalServerException.makeError(baseError: baseError)
            case "ThrottlingException": return try ThrottlingException.makeError(baseError: baseError)
            case "ValidationException": return try ValidationException.makeError(baseError: baseError)
            default: return try AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(baseError: baseError)
        }
    }
}

extension AccessDeniedException {

    static func makeError(baseError: AWSClientRuntime.RestJSONError) throws -> AccessDeniedException {
        let reader = baseError.errorBodyReader
        var value = AccessDeniedException()
        value.properties.message = try reader["message"].readIfPresent() ?? ""
        value.httpResponse = baseError.httpResponse
        value.requestID = baseError.requestID
        value.message = baseError.message
        return value
    }
}

extension InternalServerException {

    static func makeError(baseError: AWSClientRuntime.RestJSONError) throws -> InternalServerException {
        let reader = baseError.errorBodyReader
        let httpResponse = baseError.httpResponse
        var value = InternalServerException()
        if let retryAfterSecondsHeaderValue = httpResponse.headers.value(for: "Retry-After") {
            value.properties.retryAfterSeconds = Swift.Int(retryAfterSecondsHeaderValue) ?? 0
        }
        value.properties.message = try reader["message"].readIfPresent() ?? ""
        value.properties.reason = try reader["reason"].readIfPresent() ?? .sdkUnknown("")
        value.httpResponse = baseError.httpResponse
        value.requestID = baseError.requestID
        value.message = baseError.message
        return value
    }
}

extension ThrottlingException {

    static func makeError(baseError: AWSClientRuntime.RestJSONError) throws -> ThrottlingException {
        let reader = baseError.errorBodyReader
        let httpResponse = baseError.httpResponse
        var value = ThrottlingException()
        if let retryAfterSecondsHeaderValue = httpResponse.headers.value(for: "Retry-After") {
            value.properties.retryAfterSeconds = Swift.Int(retryAfterSecondsHeaderValue) ?? 0
        }
        value.properties.message = try reader["message"].readIfPresent() ?? ""
        value.httpResponse = baseError.httpResponse
        value.requestID = baseError.requestID
        value.message = baseError.message
        return value
    }
}

extension ValidationException {

    static func makeError(baseError: AWSClientRuntime.RestJSONError) throws -> ValidationException {
        let reader = baseError.errorBodyReader
        var value = ValidationException()
        value.properties.fields = try reader["fields"].readListIfPresent(memberReadingClosure: InspectorScanClientTypes.ValidationExceptionField.read(from:), memberNodeInfo: "member", isFlattened: false)
        value.properties.message = try reader["message"].readIfPresent() ?? ""
        value.properties.reason = try reader["reason"].readIfPresent() ?? .sdkUnknown("")
        value.httpResponse = baseError.httpResponse
        value.requestID = baseError.requestID
        value.message = baseError.message
        return value
    }
}

extension InspectorScanClientTypes.ValidationExceptionField {

    static func read(from reader: SmithyJSON.Reader) throws -> InspectorScanClientTypes.ValidationExceptionField {
        guard reader.hasContent else { throw SmithyReadWrite.ReaderError.requiredValueNotPresent }
        var value = InspectorScanClientTypes.ValidationExceptionField()
        value.name = try reader["name"].readIfPresent() ?? ""
        value.message = try reader["message"].readIfPresent() ?? ""
        return value
    }
}

public enum InspectorScanClientTypes {}
