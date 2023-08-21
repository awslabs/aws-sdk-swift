//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSClientRuntime
import XCTest

class APIMetadataTests: XCTestCase {

    func test_description_sanitizesServiceIDAndVersion() {
        let subject = APIMetadata(serviceId: "Elastic 🤡 Service", version: "1.0.🤡")

        XCTAssertEqual(subject.description, "api/elastic_-_service#1.0.-")
    }
}
