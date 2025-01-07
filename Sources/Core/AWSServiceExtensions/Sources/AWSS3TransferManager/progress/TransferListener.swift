//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyHTTPAPI

public protocol TransferListener {
    // This method is invoked exactly once per transfer, right after the operation has starrted.
    func transferInitiated(request: HTTPRequest, snapshot: TransferProgressSnapshot)
    
    // Number of bytes submitted or received. Must be called at least once if transfer is successful.
    func bytesTransferred(request: HTTPRequest, snapshot: TransferProgressSnapshot)
    
    // The transfer has completed successfully. This method is called exactly once for a successful transfer.
    func transferComplete(request: HTTPRequest, response: HTTPResponse, snapshot: TransferProgressSnapshot)
    
    // The transfer has failed. This method is called exactly once for a failed transfer.
    func transferFailed(request: HTTPRequest, snapshot: TransferProgressSnapshot)
}
