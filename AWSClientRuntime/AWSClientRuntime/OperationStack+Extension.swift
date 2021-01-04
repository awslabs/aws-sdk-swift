/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

extension OperationStack {
    /// This function if called adds all default middlewares to a typical sdk operation,
    ///  can optionally call from the service client inside an operation
    public mutating func addAWSMiddlewares() {
        finalizeStep.intercept(position: .after, middleware: SigV4Middleware())
        
    }
}
