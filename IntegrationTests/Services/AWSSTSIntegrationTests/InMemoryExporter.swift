//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

#if canImport(OpenTelemetrySdk)
import Foundation
import OpenTelemetrySdk

// `SpanExporter` refines `Sendable`, so this exporter's mutable state is guarded
// by a lock and its conformance is `@unchecked`.
public final class InMemoryExporter: SpanExporter, @unchecked Sendable {
  private let lock = NSLock()
  private var finishedSpanItems: [SpanData] = []
  private var isRunning: Bool = true

  public init() {}

  public func getFinishedSpanItems() -> [SpanData] {
    lock.lock()
    defer { lock.unlock() }

    return finishedSpanItems
  }

  public func export(spans: [SpanData], explicitTimeout: TimeInterval? = nil) -> SpanExporterResultCode {
    lock.lock()
    defer { lock.unlock() }

    guard isRunning else {
      return .failure
    }

    finishedSpanItems.append(contentsOf: spans)
    return .success
  }

  public func flush(explicitTimeout: TimeInterval? = nil) -> SpanExporterResultCode {
    lock.lock()
    defer { lock.unlock() }

    guard isRunning else {
      return .failure
    }

    return .success
  }

  public func reset() {
    lock.lock()
    defer { lock.unlock() }

    finishedSpanItems.removeAll()
  }

  public func shutdown(explicitTimeout: TimeInterval? = nil) {
    lock.lock()
    defer { lock.unlock() }

    finishedSpanItems.removeAll()
    isRunning = false
  }
}
#endif
