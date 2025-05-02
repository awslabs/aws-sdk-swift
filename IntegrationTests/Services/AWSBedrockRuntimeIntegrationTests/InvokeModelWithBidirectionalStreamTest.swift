//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSBedrockRuntime
import AWSClientRuntime
import ClientRuntime
import Smithy
import XCTest

final class InvokeModelWithBidirectionalStreamTest: XCTestCase {
    private var client: BedrockRuntimeClient!
    private let region = "us-east-1"
    private var requestEvents: [String] = []
    private let modelID: String = "amazon.nova-sonic-v1:0"

    // The two end events required to close the stream successfully.
    private let CONTENT_END_EVENT =
    """
     {
      "event": {
        "contentEnd": {
            "promptName": "126680f5-5859-4d15-ae70-488de4146484",
            "contentName": "b3917935-2398-4889-94a8-e677f6c3e351"
        }
      }
    }
    """
    private let PROMPT_END_EVENT =
    """
     {
      "event": {
        "promptEnd": {
            "promptName": "126680f5-5859-4d15-ae70-488de4146484",
            "contentName": "b3917935-2398-4889-94a8-e677f6c3e351"
        }
      }
    }
    """

    override func setUp() async throws {
        let PREAMBLE_EVENTS: [String] = [
            // Start Session.
            """
            {
              "event": {
                "sessionStart": {
                  "inferenceConfiguration": {
                    "maxTokens": 10000,
                    "topP": 0.95,
                    "temperature": 0.9
                  }
                }
              }
            }
            """,
            // Start Prompt.
            """
            {
              "event": {
                "promptStart": {
                  "promptName": "126680f5-5859-4d15-ae70-488de4146484",
                  "textOutputConfiguration": {
                    "mediaType": "text/plain"
                  },
                  "audioOutputConfiguration": {
                    "mediaType": "audio/lpcm",
                    "sampleRateHertz": 24000,
                    "sampleSizeBits": 16,
                    "channelCount": 1,
                    "voiceId": "en_us_matthew",
                    "encoding": "base64",
                    "audioType": "SPEECH"
                  },
                  "toolUseOutputConfiguration": {
                    "mediaType": "application/json"
                  },
                  "toolConfiguration": {
                    "tools": []
                  }
                }
              }
            }
            """,
            // Start Content.
            """
            {
              "event": {
                "contentStart": {
                  "promptName": "126680f5-5859-4d15-ae70-488de4146484",
                  "contentName": "a6431ef2-e23c-4f8c-a552-3f308629d3c3",
                  "type": "TEXT",
                  "interactive": true,
                  "textInputConfiguration": {
                    "mediaType": "text/plain"
                  }
                }
              }
            }
            """,
            // System Setup.
            """
             {
              "event": {
                "textInput": {
                  "promptName": "126680f5-5859-4d15-ae70-488de4146484",
                  "contentName": "a6431ef2-e23c-4f8c-a552-3f308629d3c3",
                  "content": "You are a friend. The user and you will engage in a spoken dialog exchanging the transcripts of a natural real-time conversation. Keep your responses short, generally two or three sentences for chatty scenarios.",
                  "role": "SYSTEM"
                }
              }
            }
            """,
            // End System Setup.
            """
             {
              "event": {
                "contentEnd": {
                    "promptName": "126680f5-5859-4d15-ae70-488de4146484",
                    "contentName": "a6431ef2-e23c-4f8c-a552-3f308629d3c3"
                }
              }
            }
            """,
            // Start Audio Stream.
            """
            {
              "event": {
                "contentStart": {
                  "promptName": "126680f5-5859-4d15-ae70-488de4146484",
                  "contentName": "b3917935-2398-4889-94a8-e677f6c3e351",
                  "type": "AUDIO",
                  "interactive": true,
                  "audioInputConfiguration": {
                    "mediaType": "audio/lpcm",
                    "sampleRateHertz": 16000,
                    "sampleSizeBits": 16,
                    "channelCount": 1,
                    "audioType": "SPEECH",
                    "encoding": "base64"
                  }
                }
              }
            }
            """
        ]

        // Individual audio events.
        // Contains "%@" which is a formatter string that will be replaced by
        //  the Base64-encoded audio content.
        let AUDIO_EVENT =
        """
        {
        "event": {
          "audioInput": {
            "promptName": "126680f5-5859-4d15-ae70-488de4146484",
            "contentName": "b3917935-2398-4889-94a8-e677f6c3e351",
            "content": "%@",
            "role": "USER"
          }
        }
        }
        """

        // First append preamble (setup) events.
        requestEvents.append(contentsOf: PREAMBLE_EVENTS)

        // Then, parse audio file into separate events and append them to list of events.
        guard let audioURL = Bundle.module.url(forResource: "japan16k", withExtension: "raw") else {
            throw ClientError.dataNotFound("Audio file not found.")
        }
        let audioData = try Data(contentsOf: audioURL)
        let chunkSize = 1024
        let totalSize = audioData.count
        var offset = 0

        while offset < totalSize {
            let end = min(offset + chunkSize, totalSize)
            let chunk = audioData.subdata(in: offset..<end)
            let encodedChunk = chunk.base64EncodedString()
            requestEvents.append(String(format: AUDIO_EVENT, encodedChunk))
            offset += chunkSize
        }
    }

    func testInvokeModelWithBidirectionalStream() async throws {
        // Initialize input stream & continuation for the API input.
        let inputStream: AsyncThrowingStream<BedrockRuntimeClientTypes.InvokeModelWithBidirectionalStreamInput, Swift.Error>
        let continuation: AsyncThrowingStream<BedrockRuntimeClientTypes.InvokeModelWithBidirectionalStreamInput, Swift.Error>.Continuation
        (inputStream, continuation) = AsyncThrowingStream.makeStream()

        // Start up background task that feeds events to the stream.
        Task {
            for event in requestEvents {
                let currentEvent = BedrockRuntimeClientTypes.InvokeModelWithBidirectionalStreamInput.chunk(
                    BedrockRuntimeClientTypes.BidirectionalInputPayloadPart(bytes: event.data(using: .utf8))
                )
                // Put 0.5 second delays to simulate real time events.
                try await Task.sleep(nanoseconds: UInt64(500_000_000))
                continuation.yield(currentEvent)
            }
            continuation.yield(BedrockRuntimeClientTypes.InvokeModelWithBidirectionalStreamInput.chunk(
                BedrockRuntimeClientTypes.BidirectionalInputPayloadPart(bytes: CONTENT_END_EVENT.data(using: .utf8))
            ))
            continuation.yield(BedrockRuntimeClientTypes.InvokeModelWithBidirectionalStreamInput.chunk(
                BedrockRuntimeClientTypes.BidirectionalInputPayloadPart(bytes: PROMPT_END_EVENT.data(using: .utf8))
            ))
            continuation.finish()
        }

        // Create BedrockRuntime client.
        let bedrock = try BedrockRuntimeClient(region: region)

        // Call the `invokeModelWithBidirectionalStream` API.
        let resp = try await bedrock.invokeModelWithBidirectionalStream(input: InvokeModelWithBidirectionalStreamInput(
            body: inputStream,
            modelId: modelID
        ))

        // Iterate on the returned output stream for output events.
        for try await output in resp.body! {
            switch output {
            case .chunk(let output):
                XCTAssertTrue(output.bytes != nil && !output.bytes!.isEmpty)
            case .sdkUnknown(let str):
                throw ClientError.unknownError(str)
            }
        }
    }
}
