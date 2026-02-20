//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Data
import class SmithyJSON.Deserializer
import class SmithyJSON.Serializer
import protocol SmithySerialization.Codec
import protocol SmithySerialization.ShapeDeserializer
import protocol SmithySerialization.ShapeSerializer

struct Codec: SmithySerialization.Codec {

    func makeSerializer() throws -> any ShapeSerializer {
        SmithyJSON.Serializer()
    }
    
    func makeDeserializer(data: Data) throws -> any ShapeDeserializer {
        try SmithyJSON.Deserializer(data: data)
    }
    

}
