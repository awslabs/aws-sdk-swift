//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public enum EndpointError: Error {
    case hostnameIsNil(String)
    case partitionsEmpty(String)
    case unresolved(String?)
    case authScheme(String?)
}
