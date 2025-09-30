//
//  File.swift
//  ConfigFileReader
//
//  Created by Elkins, Josh on 9/30/25.
//

// Custom error for parsing profile lines
public enum ProfileParsingError: Error, Equatable {
    case incompleteProfile(line: String)
    case invalidFormat(line: String)
}
