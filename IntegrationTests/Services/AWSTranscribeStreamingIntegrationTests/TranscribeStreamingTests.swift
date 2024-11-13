//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSIntegrationTestUtils
import Foundation
import AWSTranscribeStreaming
import protocol AWSClientRuntime.AWSServiceError

final class TranscribeStreamingTests: XCTestCase {

    // MARK: - Test transcription

    func test_single_streamTranscription() async throws {
        try await attempt()
    }

    // Concurrent stream transcription frequently fails on the CRT HTTP client with errors
    // such as:
    // code: 2058, message: "The connection has closed or is closing."
    // code: 2087, message: "Stream acquisition failed because stream manager failed to acquire a connection"
    //
    // Disable this test on the CRT client until these failures can be investigated & corrected.
    #if !os(Linux) && !os(Windows)
    func test_25xConcurrent_streamTranscription() async throws {
        // By default the TranscribeStreaming service allows 25 concurrent transcriptions.
        // More than that (which can happen when multiple test runs are being performed) will result
        // in throttling / resource exceeded errors, which may be retried (see retry logic below.)
        try await repeatConcurrently(count: 25, test: attempt)
    }
    #endif

    // MARK: - Private / implementation methods

    private func performStreamTranscription() async throws {

        // The hello-swift.wav resource is an audio file that contains an automated voice
        // saying the words "Hello transcribed streaming from Swift S. D. K.".
        // It is 2.976 seconds in duration.
        let audioURL = Bundle.module.url(forResource: "hello-swift", withExtension: "wav")!
        let audioData = try Data(contentsOf: audioURL)

        // A delay will be imposed between chunks to keep the audio streaming to the Transcribe
        // service at approximately real-time.
        let duration = 2.976
        let chunkSize = 4096
        let audioDataSize = audioData.count
        let dataRate = Double(audioDataSize) / duration
        let delay = Double(chunkSize) / dataRate

        let client = try TranscribeStreamingClient(region: "us-west-2")

        let audioStream = AsyncThrowingStream<TranscribeStreamingClientTypes.AudioStream, Error> { continuation in
            Task {
                var currentStart = 0
                var currentEnd = min(chunkSize, audioDataSize - currentStart)

                while currentStart < audioDataSize {
                    if currentStart != 0 { try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000)) }
                    let dataChunk = audioData[currentStart ..< currentEnd]

                    let audioEvent =  TranscribeStreamingClientTypes.AudioStream.audioevent(.init(audioChunk: dataChunk))
                    continuation.yield(audioEvent)

                    currentStart = currentEnd
                    currentEnd = min(currentStart + chunkSize, audioDataSize)
                }

                continuation.finish()
            }
        }
        let input = StartStreamTranscriptionInput(audioStream: audioStream,
                                                  languageCode: .enUs,
                                                  mediaEncoding: .pcm,
                                                  mediaSampleRateHertz: 8000)
        let output = try await client.startStreamTranscription(input: input)
        var fullMessage = ""
        for try await event in output.transcriptResultStream! {
            switch event {
            case .transcriptevent(let event):
                for result in event.transcript?.results ?? [] {
                    guard let transcript = result.alternatives?.first?.transcript else {
                        continue
                    }
                    if !result.isPartial {
                        fullMessage.append(transcript)
                    }
                }
            case .sdkUnknown(let data):
                XCTFail(data)
            }
        }

        // All of the following are acceptable results for the transcription, without
        // regard to capitalization.
        //
        // Due to changes to the transcription logic, all of these have been returned
        // as the transcription at some point.
        let candidates = [
            "Hello transcribed streaming from Swift S. D. K.",
            "Hello transcribed streaming from swift sdk.",
            "Hello transcribes streaming from Swift SDK.",
        ]
        XCTAssertTrue(candidates.contains(where: { $0.lowercased() == fullMessage.lowercased() }))
    }

    // Performs the stream transcription, with retry for selected errors associated with
    // rate limiting & throttling.
    //
    // Normal retry is not applied to transcribe streaming because the request body is a
    // non-rewindable stream.
    private func attempt() async throws {
        // These throttling / resource limit errors may be returned based on the number of
        // recent requests made to AWSTranscribeStreaming.
        let retryableCodes: [String?] = ["ThrottlingException", "LimitExceededException"]

        // Perform the transcribe operation, with special handling for the two retryable errors.
        do {
            try await self.performStreamTranscription()
        } catch let error as AWSServiceError where retryableCodes.contains(error.errorCode) {
            // Wait randomly between 1-3 sec, then attempt again.
            try await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...3_000_000_000))
            try await self.attempt()
        }
        // Any other error thrown is not caught and will fail the test.
    }
}
