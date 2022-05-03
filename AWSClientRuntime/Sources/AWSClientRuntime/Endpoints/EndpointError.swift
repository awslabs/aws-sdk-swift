//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

enum EndpointError: Error {
    case hostnameIsNil(String)
    case partitionsEmpty(String)
}
