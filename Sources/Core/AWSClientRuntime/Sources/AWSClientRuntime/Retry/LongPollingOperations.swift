//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Long-polling operations that back off even when the retry token bucket is empty.
/// Hard-coded until the `aws.api#longPoll` Smithy trait is available.
public enum LongPollingOperations {

    /// Service/operation pairs that are long-polling operations.
    private static let longPollingPairs: Set<String> = [
        "SQS/ReceiveMessage",
        "SFN/GetActivityTask",
        "SWF/PollForActivityTask",
        "SWF/PollForDecisionTask",
    ]

    /// Returns true if the given service/operation pair is a long-polling operation.
    public static func isLongPolling(serviceName: String, operationName: String) -> Bool {
        longPollingPairs.contains("\(serviceName)/\(operationName)")
    }
}
