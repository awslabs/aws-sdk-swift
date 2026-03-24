//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import OpenTelemetrySdk

public class InMemoryExporter: SpanExporter {
  private var finishedSpanItems: [SpanData] = []
  private var isRunning: Bool = true

  public init() {}

  public func getFinishedSpanItems() -> [SpanData] {
    return finishedSpanItems
  }

  public func export(spans: [SpanData], explicitTimeout: TimeInterval? = nil) -> SpanExporterResultCode {
    guard isRunning else {
      return .failure
    }

    finishedSpanItems.append(contentsOf: spans)
    return .success
  }

  public func flush(explicitTimeout: TimeInterval? = nil) -> SpanExporterResultCode {
    guard isRunning else {
      return .failure
    }

    return .success
  }

  public func reset() {
    finishedSpanItems.removeAll()
  }

  public func shutdown(explicitTimeout: TimeInterval? = nil) {
    finishedSpanItems.removeAll()
    isRunning = false
  }
}
