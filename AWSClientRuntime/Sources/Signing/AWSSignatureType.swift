//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
import AwsCommonRuntimeKit

public enum AWSSignatureType {
    /**
     A signature for a full http request should be computed, with header updates applied to the signing result.
     */
    case requestHeaders

    /**
     A signature for a full http request should be computed, with query param updates applied to the signing result.
     */
    case requestQueryParams

    /**
     Compute a signature for a payload chunk.  The signable's input stream should be the chunk data and the
     signable should contain the most recent signature value (either the original http request or the most recent
     chunk) in the "previous-signature" property.
     */
    case requestChunk

    /**
     Compute a signature for an event stream event.  The signable's input stream should be the event payload, the
     signable should contain the most recent signature value (either the original http request or the most recent
     event) in the "previous-signature" property as well as any event headers that should be signed with the
     exception of ":date"
     
     This option is not yet supported.
     */
    case requestEvent
    
    func toCRTType() -> SignatureType {
        switch self {
        case .requestChunk: return .requestChunk
        case .requestEvent: return .requestEvent
        case .requestHeaders: return .requestHeaders
        case .requestQueryParams: return .requestQueryParams
        }
    }
}
