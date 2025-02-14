//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import let AWSSDKPartitions.partitions

// First-time load will take longer but subsequent calls will use cached data
public let awsPartitionJSON = partitions
