//
//  File.swift
//  
//
//  Created by Paulosky, Ed on 12/21/22.
//

import Foundation

extension Data {
    func chunked(size: Int) -> [Data] {
        return stride(from: 0, to: count, by: size).map {
            self[$0 ..< Swift.min($0 + size, count)]
        }
    }
    
    func bytes() -> [UInt8] {
        return [UInt8](self)
    }
}
