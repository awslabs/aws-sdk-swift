import Foundation

extension Process {
    convenience init(_ argsList: [String]) {
        self.init()
        self.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        self.arguments = argsList
    }
    
    convenience init(_ args: String...) {
        self.init(Array(args))
    }
}

extension Process {
    struct Git {
        private func gitProcess(_ args: [String]) -> Process {
            Process(["git"] + args)
        }
        
        func diff(_ a: String, _ b: String) -> Process {
            gitProcess(["diff", "\(a)..\(b)", "--quiet"])
        }
        
        func add(_ args: String...) -> Process {
            gitProcess(["add"] + Array(args))
        }
        
        func commit(_ message: String) -> Process {
            gitProcess(["commit", "-m", message.wrappedInQuotes()])
        }
        
        func tag(_ version: Version, _ message: String) -> Process {
            gitProcess(["tag", "-a", "\(version)", "-m", message.wrappedInQuotes()])
        }
    }
    
    static var git: Git { Git() }
}

extension Process.Git {
    func diffHasChanges(_ a: String, _ b: String) throws -> Bool {
        let task = diff(a, b)
        try task.run()
        task.waitUntilExit()
        return task.terminationStatus != 0
    }
}


extension String {
    func wrapped(in char: String) -> String {
        "\(char)\(self)\(char)"
    }
    
    func wrappedInQuotes() -> String {
        wrapped(in: "\"")
    }
}
