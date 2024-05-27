//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The type of flow the middleware context is being constructed for
public enum FlowType {
    case NORMAL, PRESIGN_REQUEST, PRESIGN_URL
}
