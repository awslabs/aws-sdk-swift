//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import AWSMediaConvert

class AWSMediaConvertTests: XCTestCase {

    func test_getJobTemplate_handlesSpecialCharacters() async throws {
        let name = "Android TV Template"
        let ep = "https://4l8tgbpha.mediaconvert.us-west-2.amazonaws.com/"

        let settings = MediaConvertClientTypes.JobTemplateSettings(
            inputs: [
                MediaConvertClientTypes.InputTemplate()
            ],
            outputGroups: [
                MediaConvertClientTypes.OutputGroup(
                    outputGroupSettings: MediaConvertClientTypes.OutputGroupSettings(
                        hlsGroupSettings: MediaConvertClientTypes.HlsGroupSettings(
                            destination: "s3://jbelkins-bucket/x-out.m3u8",
                            minSegmentLength: 0,
                            segmentLength: 10
                        ),
                        type: .hlsGroupSettings
                    ),
                    outputs: [
                        MediaConvertClientTypes.Output(
                            audioDescriptions: [
                                MediaConvertClientTypes.AudioDescription(
                                    codecSettings: MediaConvertClientTypes.AudioCodecSettings(
                                        aacSettings: MediaConvertClientTypes.AacSettings(
                                            bitrate: 96000,
                                            codingMode: .codingMode20,
                                            sampleRate: 48000
                                        ),
                                        codec: .aac
                                    )
                                )
                            ],
                            containerSettings: MediaConvertClientTypes.ContainerSettings(
                                container: .m3u8
                            ),
                            nameModifier: "modifier",
                            videoDescription: MediaConvertClientTypes.VideoDescription(
                                codecSettings: MediaConvertClientTypes.VideoCodecSettings(
                                    codec: .h264,
                                    h264Settings: MediaConvertClientTypes.H264Settings(
                                        maxBitrate: 32768,
                                        rateControlMode: .qvbr,
                                        sceneChangeDetect: .transitionDetection
                                    )
                                )
                            )
                        )
                    ]
                )
            ],
            timecodeConfig: MediaConvertClientTypes.TimecodeConfig(source: .zerobased)
        )
        let config = try MediaConvertClient.MediaConvertClientConfiguration(region: "us-west-2", endpoint: ep)
        let client = MediaConvertClient(config: config)
        let input1 = CreateJobTemplateInput(name: name, settings: settings)
        let output1 = try await client.createJobTemplate(input: input1)
        let input2 = GetJobTemplateInput(name: name)
        let output2 = try await client.getJobTemplate(input: input2)
        XCTAssertEqual(output2.jobTemplate?.name, name)
    }
}
