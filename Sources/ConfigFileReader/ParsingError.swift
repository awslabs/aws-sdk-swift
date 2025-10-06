//
//  File.swift
//  ConfigFileReader
//
//  Created by Elkins, Josh on 9/30/25.
//

// Custom error for parsing lines
public enum ParsingError: Error, Equatable {
    case incompleteProfile(line: String)
    case invalidFormat(line: String)
    case invalidLineOrder(line: String)
}
