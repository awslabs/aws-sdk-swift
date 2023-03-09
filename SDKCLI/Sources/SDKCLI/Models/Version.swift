import Foundation

struct Version {
    var major: Int
    var minor: Int
    var patch: Int
    
    init(_ versionString: String) throws {
        let versions = versionString
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: ".")
        guard
            versions.count == 3,
            let major = Int(versions[0]),
            let minor = Int(versions[1]),
            let patch = Int(versions[2])
        else {
            throw Error("Failed to parse version from string \(versionString)")
        }
        
        self.major = major
        self.minor = minor
        self.patch = patch
    }
    
    var versionString: String { "\(major).\(minor).\(patch)" }
    
    mutating func incrementMajor() {
        major += 1
        minor = 0
        patch = 0
    }
    
    func incrementingMajor() -> Self {
        var copy = self
        copy.incrementMajor()
        return copy
    }
    
    mutating func incrementMinor() {
        minor += 1
        patch = 0
    }
    
    func incrementingMinor() -> Self {
        var copy = self
        copy.incrementMinor()
        return copy
    }
    
    mutating func incrementPatch() {
        patch += 1
    }
    
    func incrementingPatch() -> Self {
        var copy = self
        copy.incrementPatch()
        return copy
    }
}

extension Version: CustomStringConvertible {
    var description: String { versionString }
}

extension Version {
    static func fromFile(_ filePath: String) throws -> Version {
        guard let fileContents = FileManager.default.contents(atPath: filePath) else {
            throw Error("Failed to load data for file at path \(filePath)")
        }
        
        guard let versionString = String(data: fileContents, encoding: .utf8) else {
            throw Error("Failed to convert data to string for file at path: \(filePath)")
        }
        
        return try Version(versionString)
    }
}
