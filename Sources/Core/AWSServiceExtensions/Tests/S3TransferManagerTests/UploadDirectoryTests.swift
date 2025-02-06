//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
@testable import AWSServiceExtensions

class UploadDirectoryTests: S3TMTestCase {
    /*

     The following file structure under Resources/ is used for all tests below.

     |- source/
        |- a.txt
        |- nested/
            |- b.txt
            |- nested2/
                |- d.txt
        |- symlinkToDir
        |- symlinkToSource
     |- dir/
        |- c.txt
        |- symlinkToDir
        |- e.txt

     Expected results for getDirectlyNestedURLs on source/ : 4 top-level file URLs

     Expected results for getNestedFileURLs:
     - source/a.txt
     - source/nested/b.txt
     - source/nested/nested2/d.txt
     - source/symlinkToDir/c.txt
     - source/symlinkToDir/e.txt

         Using above directory structure with getNestedFileURLs tests handling for:
         - Top-level regular file
         - Top-level directory
         - Nested regular file
         - Nested directory
         - Symlink to directory outside of source
         - Symlink that causes infinite loop

     Expected results for getResolvedObjectKey:
     - Without s3Prefix and default s3Delimiter ("/"):
        - a.txt
        - nested/b.txt
        - nested/nested2/d.txt
        - symlinkToDir/c.txt
        - symlinkToDir/e.txt
     - With s3Prefix "pre" and custom s3Delimiter "-"
        - pre-a.txt
        - pre-nested-b.txt
        - pre-nested-nested2-d.txt
        - pre-symlinkToDir-c.txt
        - pre-symlinkToDir-e.txt

     */

    /*
     TODO: -
        1. Create symbolic links in Resources/ folder so directory matches definition above
        2. Write tests using the directory structure in Resources/.
     */

    // MARK: - getDirectlyNestedURLs tests.
    func testGetDirectlyNestedURLs() throws {
        let bundleURL = Bundle.module.resourceURL!.appendingPathComponent("Resources")
        let directlyNestedURLs = try UploadDirectoryTests.tm.getDirectlyNestedURLs(in: bundleURL, isSymlink: false)
        for url in directlyNestedURLs {
            print(url)
        }
    }

    // MARK: - getNestedFileURLs tests.

    // MARK: - getResolvedObjectKey tests.
}
