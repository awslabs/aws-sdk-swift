import ArgumentParser
import Foundation

struct TagSmithySwift: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Tags the smithy-swift repository for release",
        discussion: "If there are no changes, then this does nothing as there is nothing new to release"
    )
    
    @Argument(help: "The path to the smithy-swift repo.")
    var smithySwiftPath: String
    
    func run() throws {
        guard FileManager.default.changeCurrentDirectoryPath(smithySwiftPath) else {
            throw Error("Failed to change directory to \(smithySwiftPath)")
        }
        
        let filePath = "Package.version"
        let version = try Version.fromFile(filePath)
        
        print("Latest release version: \(version.versionString)")
        
        // Detect changes
        guard try Process.git.diffHasChanges("main", "\(version)") else {
            print("No changes detected between 'main' and the latest release \(version)")
            return
        }
        print("Changes detected between 'main' and the latest release \(version)")
        
        // Update the version
        let newVersion = version.incrementingMinor()
        do {
          try "\(newVersion)".write(toFile: filePath , atomically: true, encoding: .utf8)
        } catch {
          throw Error("Failed to write version \(newVersion) to \(filePath)")
        }
        print("New version: \(newVersion)")
        
        print("Staging \(filePath)")
        try Process.git.add(filePath).run()
        
        print("Commit changes")
        try Process.git.commit("Updates version to \(newVersion)").run()
        
        print("Tagging version \(newVersion)")
        try Process.git.tag(newVersion, "Release \(newVersion)").run()
    }
}
