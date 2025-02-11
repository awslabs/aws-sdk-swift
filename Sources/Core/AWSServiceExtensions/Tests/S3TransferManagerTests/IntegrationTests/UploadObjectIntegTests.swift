//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

class UploadObjectIntegTests: S3TMUnitTestCase {
    // MARK: - uploadObject tests.

    /*
        - Object size <= single part size
            - 4MB
            - 8MB
        - single part size < Object size < MPU threshold
            - 12MB
        - Object size >= MPU threshold
            - 16 MB
            - 50 MB
            - 100 MB
            - 500 MB
            - 5 GB
            - 50 GB
            - 1 TB
            - 5 TB
     */

    func testUploadObject4MB() async throws {

    }

    func testUploadObject8MB() async throws {

    }

    func testUploadObject12MB() async throws {

    }

    func testUploadObject16MB() async throws {

    }

    func testUploadObject50MB() async throws {

    }

    func testUploadObject100MB() async throws {

    }

    func testUploadObject500MB() async throws {

    }

    func testUploadObject5GB() async throws {

    }

    func testUploadObject50GB() async throws {

    }

    func testUploadObject1TB() async throws {

    }

    func testUploadObject5TB() async throws {

    }
}
