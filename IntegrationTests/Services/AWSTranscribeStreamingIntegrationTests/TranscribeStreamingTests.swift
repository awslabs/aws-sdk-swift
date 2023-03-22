//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import Foundation
import AWSTranscribeStreaming

final class TranscribeStreamingTests: XCTestCase {
    func testStartStreamTranscription() async throws {
        let audioURL = Bundle.module.url(forResource: "hello-swift", withExtension: "wav")!
        let audioData = try Data(contentsOf: audioURL)

        let chunkSize = 4096
        let audioDataSize = audioData.count

        let client = try TranscribeStreamingClient(region: "us-west-2")

        let audioStream = AsyncThrowingStream<TranscribeStreamingClientTypes.AudioStream, Error> { continuation in
            Task {
                var currentStart = 0
                var currentEnd = min(chunkSize, audioDataSize - currentStart)

                while currentStart < audioDataSize {
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

        XCTAssertTrue(fullMessage.starts(with: "Good day to you transcribe streaming"))
    }
}
