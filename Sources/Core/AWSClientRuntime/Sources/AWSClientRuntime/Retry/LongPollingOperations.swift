//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Hard-coded list of long-polling operations.  Replace with the `aws.api#longPoll`
/// Smithy trait once it's available.
public enum LongPollingOperations {

    private static let longPollingPairs: Set<String> = [
        "SQS/receiveMessage",
        "SFN/getActivityTask",
        "SWF/pollForActivityTask",
        "SWF/pollForDecisionTask",
    ]

    public static func isLongPolling(serviceName: String, operationName: String) -> Bool {
        longPollingPairs.contains("\(serviceName)/\(operationName)")
    }
}
