# Implementation Plan: Enable AWS Chunked Configuration

## Overview

This implementation plan breaks down the addition of the `enableAWSChunked` configuration option into discrete, incremental steps. The approach follows the existing patterns in the AWS SDK for Swift and ensures backward compatibility while adding the new functionality.

## Tasks

- [x] 1. Add enableAWSChunked property to S3ClientConfig
  - Add `public var enableAWSChunked: Swift.Bool?` property to S3ClientConfig struct
  - Add `public var enableAWSChunked: Swift.Bool?` property to deprecated S3ClientConfiguration class
  - Position the property after `disableS3ExpressSessionAuth` for logical grouping
  - _Requirements: 1.1, 1.2, 1.4_

- [x] 2. Update S3ClientConfig initializers
  - [x] 2.1 Add enableAWSChunked parameter to first synchronous initializer
    - Add `enableAWSChunked: Swift.Bool? = nil` parameter
    - Add `self.enableAWSChunked = enableAWSChunked` to initialization
    - _Requirements: 1.2, 1.3_
  
  - [x] 2.2 Add enableAWSChunked parameter to async initializer
    - Add `enableAWSChunked: Swift.Bool? = nil` parameter
    - Add `self.enableAWSChunked = enableAWSChunked` to initialization
    - _Requirements: 1.2, 1.3_
  
  - [x] 2.3 Add enableAWSChunked parameter to region-based initializer
    - Add `enableAWSChunked: Swift.Bool? = nil` parameter
    - Add `self.enableAWSChunked = enableAWSChunked` to initialization
    - _Requirements: 1.2, 1.3_
  
  - [ ]* 2.4 Write unit tests for configuration storage
    - Test default value is nil
    - Test setting to true
    - Test setting to false
    - _Requirements: 1.2, 1.4_

- [x] 3. Update deprecated S3ClientConfiguration initializers
  - [x] 3.1 Add enableAWSChunked parameter to synchronous initializer
    - Add `enableAWSChunked: Swift.Bool? = nil` parameter
    - Add `self.enableAWSChunked = enableAWSChunked` to initialization
    - _Requirements: 1.2, 1.3, 6.2_
  
  - [x] 3.2 Add enableAWSChunked parameter to async initializer
    - Add `enableAWSChunked: Swift.Bool? = nil` parameter
    - Add `self.enableAWSChunked = enableAWSChunked` to initialization
    - _Requirements: 1.2, 1.3, 6.2_
  
  - [x] 3.3 Update toSendable() conversion method
    - Add `enableAWSChunked: self.enableAWSChunked` to conversion
    - _Requirements: 6.1, 6.2_

- [x] 4. Create Context extension for enableAWSChunked
  - Create or extend Context with enableAWSChunked property
  - Define AttributeKey for type-safe access
  - Implement getter and setter using attributes
  - _Requirements: 2.2_
  
  - [ ]* 4.1 Write unit tests for context attribute access
    - Test setting and getting nil value
    - Test setting and getting true value
    - Test setting and getting false value
    - _Requirements: 2.2, 2.3_

- [x] 5. Checkpoint - Verify configuration infrastructure
  - Ensure all tests pass
  - Verify configuration can be set and retrieved
  - Ask the user if questions arise

- [x] 6. Update FlexibleChecksumsRequestMiddleware
  - [x] 6.1 Add enableAWSChunked configuration check
    - Read `enableAWSChunked` from context attributes
    - Implement three-way logic: nil (auto-detect), true (force enable), false (force disable)
    - _Requirements: 3.1, 4.1, 5.1_
  
  - [x] 6.2 Implement force enable logic
    - When enableAWSChunked is true and body is stream, apply aws-chunked headers
    - When enableAWSChunked is true and body is not stream, throw ClientError
    - _Requirements: 3.1, 3.2, 3.3_
  
  - [x] 6.3 Implement force disable logic
    - When enableAWSChunked is false, skip aws-chunked headers regardless of stream eligibility
    - Ensure checksums still work without aws-chunked encoding
    - _Requirements: 4.1, 4.2, 4.3_
  
  - [x] 6.4 Implement auto-detect logic
    - When enableAWSChunked is nil, use existing stream.isEligibleForChunkedStreaming check
    - Maintain backward compatibility with current behavior
    - _Requirements: 5.1, 5.2, 5.3, 6.1_
  
  - [ ]* 6.5 Write property test for force enable
    - **Property 3: Force Enable Applies AWS-Chunked**
    - **Validates: Requirements 3.1, 3.2**
  
  - [ ]* 6.6 Write property test for force enable error handling
    - **Property 4: Force Enable With Non-Stream Throws Error**
    - **Validates: Requirements 3.3, 7.1**
  
  - [ ]* 6.7 Write property test for force disable
    - **Property 5: Force Disable Prevents AWS-Chunked**
    - **Validates: Requirements 4.1, 4.2**
  
  - [ ]* 6.8 Write property test for checksums without aws-chunked
    - **Property 6: Checksums Work Without AWS-Chunked**
    - **Validates: Requirements 4.3**
  
  - [ ]* 6.9 Write property test for auto-detection
    - **Property 7: Auto-Detection Matches Stream Eligibility**
    - **Validates: Requirements 5.1, 5.2, 5.3**
  
  - [ ]* 6.10 Write unit tests for error messages
    - Test error message content for non-stream body with enableAWSChunked=true
    - _Requirements: 7.2_

- [x] 7. Add configuration propagation to operation builders
  - Identify where requestChecksumCalculation is propagated to context
  - Add `.withEnableAWSChunked(value: config.enableAWSChunked)` to context builder chain
  - Apply to all S3 operations that use FlexibleChecksumsRequestMiddleware
  - _Requirements: 2.1_
  
  - [ ]* 7.1 Write property test for configuration propagation
    - **Property 2: Configuration Propagation**
    - **Validates: Requirements 2.1**

- [x] 8. Checkpoint - Verify middleware behavior
  - Ensure all tests pass
  - Verify force enable, force disable, and auto-detect modes work correctly
  - Ask the user if questions arise

- [ ] 9. Add backward compatibility tests
  - [ ]* 9.1 Write property test for backward compatibility
    - **Property 8: Backward Compatibility**
    - **Validates: Requirements 6.1**
  
  - [ ]* 9.2 Write unit tests comparing nil behavior to original implementation
    - Test with eligible streams
    - Test with non-eligible streams
    - _Requirements: 6.1_

- [ ] 10. Add integration tests
  - [ ]* 10.1 Write integration test for S3 upload with force enable
    - Create S3Client with enableAWSChunked=true
    - Perform streaming upload
    - Verify aws-chunked headers are present
    - _Requirements: 3.1_
  
  - [ ]* 10.2 Write integration test for S3 upload with force disable
    - Create S3Client with enableAWSChunked=false
    - Perform streaming upload
    - Verify aws-chunked headers are not present
    - _Requirements: 4.1_
  
  - [ ]* 10.3 Write integration test for S3 upload with auto-detect
    - Create S3Client with enableAWSChunked=nil
    - Perform streaming upload
    - Verify behavior matches current implementation
    - _Requirements: 5.1, 6.1_

- [x] 11. Final checkpoint - Comprehensive testing
  - Ensure all tests pass
  - Verify backward compatibility
  - Verify error handling
  - Ask the user if questions arise

## Notes

- Tasks marked with `*` are optional and can be skipped for faster MVP
- Since S3Client.swift is generated code, modifications may need to be made to the Smithy code generator
- The implementation follows existing patterns for S3-specific configuration options
- Property tests should run a minimum of 100 iterations each
- Each property test must reference its design document property in a comment
