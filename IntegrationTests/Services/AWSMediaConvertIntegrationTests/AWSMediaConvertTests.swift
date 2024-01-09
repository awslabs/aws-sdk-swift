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
        let region = "us-west-2"

        // MediaConvert requires that you use a provided endpoint for all requests.
        // Retrieve the endpoint for all subsequent requests.
        let client0 = try MediaConvertClient(region: region)
        let input0 = DescribeEndpointsInput()
        let output0 = try await client0.describeEndpoints(input: input0)
        guard let endpoint = output0.endpoints?.first?.url else {
            XCTFail("Unable to retrieve endpoint")
            return
        }

        // Create a client, configured to use the endpoint you just retrieved.
        let config = try MediaConvertClient.MediaConvertClientConfiguration(region: region, endpoint: endpoint)
        let client = MediaConvertClient(config: config)

        let name = "Android TV Template"

        // These job template settings are filled in just enough to form a valid job template for creation.
        let settings = MediaConvertClientTypes.JobTemplateSettings(
            inputs: [
                MediaConvertClientTypes.InputTemplate()
            ],
            outputGroups: [
                MediaConvertClientTypes.OutputGroup(
                    outputGroupSettings: MediaConvertClientTypes.OutputGroupSettings(
                        hlsGroupSettings: MediaConvertClientTypes.HlsGroupSettings(
                            destination: "s3://aws-sdk-mediaconvert-integration-test/out.m3u8",
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

        // Create a new template.
        let input1 = CreateJobTemplateInput(name: name, settings: settings)
        let output1 = try await client.createJobTemplate(input: input1)

        // Get the template back again.
        let input2 = GetJobTemplateInput(name: name)
        let output2 = try await client.getJobTemplate(input: input2)

        // Verify the name of the created & retrieved templates is the same as the original
        XCTAssertEqual(output1.jobTemplate?.name, name)
        XCTAssertEqual(output1.jobTemplate?.name, output2.jobTemplate?.name)
    }
}
