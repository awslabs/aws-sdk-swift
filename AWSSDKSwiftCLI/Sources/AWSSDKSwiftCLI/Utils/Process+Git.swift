//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import PackageDescription

extension Process {
    /// A struct to create processes for executing git commands.
    struct Git {
        /// Returns a process for executing git commands.
        private func gitProcess(_ args: [String]) -> Process {
            Process(["git"] + args)
        }
        
        /// Returns a process for executing `git diff <a>..<b> --quiet`
        /// This is used for determining if `<a>` is different from `<b>` and therefore
        func diff(_ a: String, _ b: String) -> Process {
            gitProcess(["diff", "\(a)..\(b)", "--quiet"])
        }
        
        /// Returns a process for executing `git add <args>`
        /// This is used for staging specific files.
        func add(_ args: String...) -> Process {
            gitProcess(["add"] + Array(args))
        }
        
        /// Returns a process for executing `git commit -m <message>`
        /// This is used for committing changes with the provided message
        func commit(_ message: String) -> Process {
            gitProcess(["commit", "-m", message.wrappedInQuotes()])
        }
        
        /// Returns a process for executing `git tag -a <version> -m <message>`
        /// This is used for creating a tag with the provided version and message.
        func tag(_ version: Version, _ message: String) -> Process {
            gitProcess(["tag", "-a", "\(version)", "-m", message.wrappedInQuotes()])
        }
        
        /// Returns a process for executing `git update-index --refresh`
        /// This is used to clear the index of any files that were changed but their contents don't include any changes when compared to the existing file.
        /// For example when generating code, such as a service client, this would clear the index if the generated code is exactly the same as the existing code.
        func updateIndex() -> Process {
            gitProcess(["update-index", "--refresh"])
        }
        
        /// Returns a process for executing `git diff index --quiet HEAD --`
        /// This is used for determining if the local working copy has changes
        func diffIndex() -> Process {
            gitProcess(["diff-index", "--quiet", "HEAD", "--"])
        }
    }
    
    static var git: Git { Git() }
}

extension Process.Git {
    /// Returns true if the provided commits/branches/trees are different, otherwise returns false
    func diffHasChanges(_ a: String, _ b: String) throws -> Bool {
        let task = diff(a, b)
        try _run(task)
        task.waitUntilExit()
        return task.terminationStatus != 0
    }
    
    /// Returns true if the local working copy has unstaged or uncommitted changes, otherwise returns false.
    func hasLocalChanges() throws -> Bool {
        let updateIndexTask = updateIndex()
        try _run(updateIndexTask)
        updateIndexTask.waitUntilExit()
        
        let diffIndexTask = diffIndex()
        try _run(diffIndexTask)
        diffIndexTask.waitUntilExit()
        return diffIndexTask.terminationStatus != 0
    }
}
