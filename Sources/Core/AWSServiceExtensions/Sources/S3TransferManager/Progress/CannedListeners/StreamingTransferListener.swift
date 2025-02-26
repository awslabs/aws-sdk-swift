//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// The `TransferListener` type that streams events to `AsyncThrowingStream` for asynchronous and customized handling of `TransferEvent`s.
///
/// This transfer listener allows custom handling of each transfer event defined by the `TransferEvent` enum.
/// To use, first initialize an instance of the listener, and include it as one of the listeners in the corresponding `S3TransferManger` operation's input (e.g., `UploadObjectInput.transferListeners`).
/// Then, start up a `Task` that asynchronously consumes the events from the stream before invoking the `S3TransferManager` operation.
/// After you're done with using the listener, you must explicitly close the underlying stream by calling `closeStream()` on it.
///
/// See below for the example usage that consumes `uploadObject` operation's events.
///
/// ```
/// let fileURL = /* Create a file and get its URL. */
///
/// // Create the StreamingTransferListener.
/// let streamingTransferListener = StreamingTransferListener()
///
/// // Start up the background Task that consumes events from the stream.
/// Task {
///     for try await event in streamingTransferListener.stream {
///         switch event {
///         case .uploadObjectInitiated(let input, let snapshot):
///             // Do custom stuff.
///         case .uploadObjectBytesTransferred(let input, let snapshot):
///             // Do custom stuff.
///         case .uploadObjectComplete(let input, let output, let snapshot):
///             // Do custom stuff.
///             streamingListener.closeStream() // Close stream explicitly if it won't be used anymore.
///         case .uploadObjectFailed(let input, let snapshot):
///             // Do custom stuff.
///             streamingListener.closeStream() // Close stream explicitly if it won't be used anymore.
///         default:
///             break
///         }
///     }
/// }
///
/// // Invoke the transfer manager operation with the streaming transfer listener configured in the input.
/// let uploadObjectTask = try transferManager.uploadObject(input: UploadObjectInput(
///     putObjectInput: PutObjectInput(
///         body: ByteStream.stream(FileStream(fileHandle: FileHandle(forReadingFrom: fileURL))),
///         bucket: /* Your bucket name. */,
///         key: /* The S3 object key you want to use. */
///     ),
///     transferListeners: [streamingTransferListener]
/// ))
/// ```
public class StreamingTransferListener: TransferListener {
    /// The async stream that can be asynchronously iterated on to retrieve the published events.
    public let stream: AsyncThrowingStream<TransferEvent, Error>

    // The continuation used internally to send events to the stream.
    private let continuation: AsyncThrowingStream<TransferEvent, Error>.Continuation

    /// Initializes `StreamingTransferListener`.
    ///
    /// Creates a stream of type `AsyncThrowingStream<TransferEvent, Error>`.
    /// Instances of the `TransferEvent` enum will be published to that stream for custom event handling by the user.
    public init() {
        (self.stream, self.continuation) = AsyncThrowingStream.makeStream()
    }

    /// Closes the stream used by the `StreamingTransferListener` instance.
    public func closeStream() {
        continuation.finish()
    }

    public func onTransferInitiated(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let transferInputType = TransferInputType(from: input)
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.uploadObjectInitiated(
                input: uploadObjectInput,
                snapshot: singleObjectSnapshot
            ))
        case .downloadObject(let downloadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.downloadObjectInitiated(
                input: downloadObjectInput,
                snapshot: singleObjectSnapshot
            ))
        case .uploadDirectory(let uploadDirectoryInput):
            let directorySnapshot = snapshot as! DirectoryTransferProgressSnapshot
            continuation.yield(TransferEvent.uploadDirectoryInitiated(
                input: uploadDirectoryInput,
                snapshot: directorySnapshot
            ))
        case .downloadBucket(let downloadBucketInput):
            let directorySnapshot = snapshot as! DirectoryTransferProgressSnapshot
            continuation.yield(TransferEvent.downloadBucketInitiated(
                input: downloadBucketInput,
                snapshot: directorySnapshot
            ))
        }
    }

    public func onBytesTransferred(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let transferInputType = TransferInputType(from: input)
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.uploadObjectBytesTransferred(
                input: uploadObjectInput,
                snapshot: singleObjectSnapshot
            ))
        case .downloadObject(let downloadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.downloadObjectBytesTransferred(
                input: downloadObjectInput,
                snapshot: singleObjectSnapshot
            ))
        case .uploadDirectory:
            return // Intentionally no-op. `uploadObject` handles lower-level byte transfer events above.
        case .downloadBucket:
            return // Intentionally no-op. `downloadObject` handles lower-level byte transfer events above.
        }
    }

    public func onTransferComplete(input: any TransferInput, output: any TransferOutput, snapshot: any TransferProgressSnapshot) {
        let transferInputType = TransferInputType(from: input)
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.uploadObjectComplete(
                input: uploadObjectInput,
                output: output as! UploadObjectOutput,
                snapshot: singleObjectSnapshot
            ))
        case .downloadObject(let downloadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.downloadObjectComplete(
                input: downloadObjectInput,
                output: output as! DownloadObjectOutput,
                snapshot: singleObjectSnapshot
            ))
        case .uploadDirectory(let uploadDirectoryInput):
            let directorySnapshot = snapshot as! DirectoryTransferProgressSnapshot
            continuation.yield(TransferEvent.uploadDirectoryComplete(
                input: uploadDirectoryInput,
                output: output as! UploadDirectoryOutput,
                snapshot: directorySnapshot
            ))
        case .downloadBucket(let downloadBucketInput):
            let directorySnapshot = snapshot as! DirectoryTransferProgressSnapshot
            continuation.yield(TransferEvent.downloadBucketComplete(
                input: downloadBucketInput,
                output: output as! DownloadBucketOutput,
                snapshot: directorySnapshot
            ))
        }
    }

    public func onTransferFailed(input: any TransferInput, snapshot: any TransferProgressSnapshot) {
        let transferInputType = TransferInputType(from: input)
        switch transferInputType {
        case .uploadObject(let uploadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.uploadObjectFailed(
                input: uploadObjectInput,
                snapshot: singleObjectSnapshot
            ))
        case .downloadObject(let downloadObjectInput):
            let singleObjectSnapshot = snapshot as! SingleObjectTransferProgressSnapshot
            continuation.yield(TransferEvent.downloadObjectFailed(
                input: downloadObjectInput,
                snapshot: singleObjectSnapshot
            ))
        case .uploadDirectory(let uploadDirectoryInput):
            let directorySnapshot = snapshot as! DirectoryTransferProgressSnapshot
            continuation.yield(TransferEvent.uploadDirectoryFailed(
                input: uploadDirectoryInput,
                snapshot: directorySnapshot
            ))
        case .downloadBucket(let downloadBucketInput):
            let directorySnapshot = snapshot as! DirectoryTransferProgressSnapshot
            continuation.yield(TransferEvent.downloadBucketFailed(
                input: downloadBucketInput,
                snapshot: directorySnapshot
            ))
        }
    }
}

/// The event types of `StreamingTransferListener`.
public enum TransferEvent {
    // `uploadObject` events.
    case uploadObjectInitiated(input: UploadObjectInput, snapshot: SingleObjectTransferProgressSnapshot)
    case uploadObjectBytesTransferred(input: UploadObjectInput, snapshot: SingleObjectTransferProgressSnapshot)
    case uploadObjectComplete(
        input: UploadObjectInput,
        output: UploadObjectOutput,
        snapshot: SingleObjectTransferProgressSnapshot
    )
    case uploadObjectFailed(input: UploadObjectInput, snapshot: SingleObjectTransferProgressSnapshot)

    // `downloadObject` events.
    case downloadObjectInitiated(input: DownloadObjectInput, snapshot: SingleObjectTransferProgressSnapshot)
    case downloadObjectBytesTransferred(input: DownloadObjectInput, snapshot: SingleObjectTransferProgressSnapshot)
    case downloadObjectComplete(
        input: DownloadObjectInput,
        output: DownloadObjectOutput,
        snapshot: SingleObjectTransferProgressSnapshot
    )
    case downloadObjectFailed(input: DownloadObjectInput, snapshot: SingleObjectTransferProgressSnapshot)

    // `uploadDirectory` events.
    case uploadDirectoryInitiated(input: UploadDirectoryInput, snapshot: DirectoryTransferProgressSnapshot)
    case uploadDirectoryComplete(
        input: UploadDirectoryInput,
        output: UploadDirectoryOutput,
        snapshot: DirectoryTransferProgressSnapshot
    )
    case uploadDirectoryFailed(input: UploadDirectoryInput, snapshot: DirectoryTransferProgressSnapshot)

    // `downloadBucket` events.
    case downloadBucketInitiated(input: DownloadBucketInput, snapshot: DirectoryTransferProgressSnapshot)
    case downloadBucketComplete(
        input: DownloadBucketInput,
        output: DownloadBucketOutput,
        snapshot: DirectoryTransferProgressSnapshot
    )
    case downloadBucketFailed(input: DownloadBucketInput, snapshot: DirectoryTransferProgressSnapshot)
}
