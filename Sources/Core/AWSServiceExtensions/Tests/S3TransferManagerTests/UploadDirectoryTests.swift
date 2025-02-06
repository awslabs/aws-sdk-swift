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
         The following file structure under Resources/UploadDirectoryTestsResources/ is used by multiple tests.

         |- source/
            |- nested/
                |- nested2/
                    |- d.txt
                |- b.txt
            |- a.txt
            |- symlinkToOutsideSourceDir
            |- symlinkToSourceDir
         |- outsideSource/
            |- c.txt
            |- e.txt
            |- symlinkToOutsideSourceDir
     */

    // MARK: - getDirectlyNestedURLs tests.

    /*
         Expected results for getDirectlyNestedURLs on source/ :
         - source/nested/
         - source/a.txt
         - source/symlinkToOutsideSourceDir
         - source/symlinkToSourceDir
     */
    func testGetDirectlyNestedURLs() throws {
        let bundleURL = Bundle.module.resourceURL!.appendingPathComponent("Resources/UploadDirectoryTestsResources")
        let directlyNestedURLs = try UploadDirectoryTests.tm.getDirectlyNestedURLs(in: bundleURL, isSymlink: false)
        for url in directlyNestedURLs {
            print(url)
        }
    }

    // MARK: - getNestedFileURLs tests.

    /*
         Expected results for getNestedFileURLs:
         - source/nested/nested2/d.txt
         - source/nested/b.txt
         - source/a.txt
         - source/symlinkToOutsideSourceDir/c.txt
         - source/symlinkToOutsideSourceDir/e.txt

         Using above directory structure with getNestedFileURLs tests:
         - Top-level regular file
         - Top-level directory
         - Nested regular file
         - Nested directory
         - Symlink to directory outside of source
         - Symlink that causes infinite loop
     */
    func testGetNestedFileURLs() {
        
    }

    // MARK: - getResolvedObjectKey tests.
}
