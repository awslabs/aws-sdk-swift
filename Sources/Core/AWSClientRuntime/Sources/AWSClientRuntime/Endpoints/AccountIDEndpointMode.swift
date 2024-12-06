//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Determines how & whether an account ID-based endpoint will be used for requests.
public enum AccountIDEndpointMode: String {
    // Note : these case names match string values for the accountIdEndpointMode endpoint param.
    // Do not rename them

    /// An account ID-based endpoint will be used if an account ID is available.
    ///
    /// This is the default mode.
    case preferred  // the default case

    /// An account ID-based endpoint will never be used.
    ///
    /// The request will fail if a non-account ID-based endpoint is not available.
    case disabled

    /// An account ID-based endpoint will always be used.
    ///
    /// The request will fail if an account ID-based endpoint cannot be constructed.
    case required
}
