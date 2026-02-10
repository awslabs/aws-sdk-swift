# Requirements Document

## Introduction

This document specifies the requirements for adding an `enableAWSChunked` configuration option to the AWS SDK for Swift's S3ClientConfiguration. This feature will allow users to explicitly control whether aws-chunked encoding should be enabled or disabled for S3 operations, providing more flexibility than the current automatic behavior.

## Glossary

- **S3ClientConfig**: The configuration struct for S3Client that contains all client-level settings
- **FlexibleChecksumsRequestMiddleware**: The middleware component responsible for applying flexible checksums and aws-chunked encoding to requests
- **AWS_Chunked_Encoding**: A transfer encoding mechanism that allows streaming uploads with trailing checksums
- **Context**: The request context object that carries configuration and state through the middleware pipeline
- **Chunked_Eligible_Stream**: A stream that meets the criteria for aws-chunked encoding (is a stream, has eligible properties)

## Requirements

### Requirement 1: Configuration Property

**User Story:** As an SDK user, I want to configure whether aws-chunked encoding is enabled, so that I can control this behavior for my specific use case.

#### Acceptance Criteria

1. THE S3ClientConfig SHALL include an `enableAWSChunked` property of type `Bool?`
2. WHEN `enableAWSChunked` is `nil`, THE S3ClientConfig SHALL use the default value of `nil`
3. THE S3ClientConfig initializers SHALL accept an optional `enableAWSChunked` parameter
4. THE S3ClientConfig SHALL store the `enableAWSChunked` value for use by middleware

### Requirement 2: Context Propagation

**User Story:** As a middleware developer, I want the `enableAWSChunked` configuration to be available in the request context, so that I can access it when processing requests.

#### Acceptance Criteria

1. WHEN a request is initialized, THE System SHALL propagate the `enableAWSChunked` configuration value to the request context
2. THE Context SHALL provide access to the `enableAWSChunked` value through an attribute
3. WHEN `enableAWSChunked` is not set in configuration, THE Context SHALL contain `nil` for this attribute

### Requirement 3: Middleware Behavior - Force Enable

**User Story:** As an SDK user, I want to force enable aws-chunked encoding, so that it is always applied regardless of automatic detection.

#### Acceptance Criteria

1. WHEN `enableAWSChunked` is `true`, THE FlexibleChecksumsRequestMiddleware SHALL apply aws-chunked encoding
2. WHEN `enableAWSChunked` is `true` AND the request body is a stream, THE FlexibleChecksumsRequestMiddleware SHALL set aws-chunked headers
3. WHEN `enableAWSChunked` is `true` AND the request body is not a stream, THE FlexibleChecksumsRequestMiddleware SHALL throw an error indicating aws-chunked encoding requires a streaming payload

### Requirement 4: Middleware Behavior - Force Disable

**User Story:** As an SDK user, I want to force disable aws-chunked encoding, so that it is never applied even when conditions would normally trigger it.

#### Acceptance Criteria

1. WHEN `enableAWSChunked` is `false`, THE FlexibleChecksumsRequestMiddleware SHALL NOT apply aws-chunked encoding
2. WHEN `enableAWSChunked` is `false` AND the stream is chunked eligible, THE FlexibleChecksumsRequestMiddleware SHALL NOT set aws-chunked headers
3. WHEN `enableAWSChunked` is `false`, THE FlexibleChecksumsRequestMiddleware SHALL process checksums without aws-chunked encoding

### Requirement 5: Middleware Behavior - Auto-Detect

**User Story:** As an SDK user, I want the default behavior to remain unchanged when I don't specify the configuration, so that existing code continues to work.

#### Acceptance Criteria

1. WHEN `enableAWSChunked` is `nil`, THE FlexibleChecksumsRequestMiddleware SHALL use automatic detection based on stream eligibility
2. WHEN `enableAWSChunked` is `nil` AND the stream is chunked eligible, THE FlexibleChecksumsRequestMiddleware SHALL apply aws-chunked encoding
3. WHEN `enableAWSChunked` is `nil` AND the stream is not chunked eligible, THE FlexibleChecksumsRequestMiddleware SHALL NOT apply aws-chunked encoding

### Requirement 6: Backward Compatibility

**User Story:** As an existing SDK user, I want my code to continue working without changes, so that I don't need to update my application when upgrading the SDK.

#### Acceptance Criteria

1. WHEN `enableAWSChunked` is not specified in configuration, THE System SHALL behave identically to the current implementation
2. THE S3ClientConfig initializers SHALL maintain all existing parameters and default values
3. WHEN existing code is compiled against the new SDK version, THE System SHALL not require any code changes

### Requirement 7: Error Handling

**User Story:** As an SDK user, I want clear error messages when I misconfigure aws-chunked encoding, so that I can quickly identify and fix the issue.

#### Acceptance Criteria

1. WHEN `enableAWSChunked` is `true` AND the request body is not a stream, THE System SHALL throw a ClientError with a descriptive message
2. THE error message SHALL indicate that aws-chunked encoding requires a streaming payload
3. WHEN an error occurs, THE System SHALL not proceed with the request
