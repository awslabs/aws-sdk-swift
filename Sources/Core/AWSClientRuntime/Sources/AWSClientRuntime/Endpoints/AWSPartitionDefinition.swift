//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import let AWSSDKPartitions.partitions

// First-time load will take longer but subsequent calls will use cached data
// swiftlint:disable:next force_try
public let awsPartitionJSON = partitions
