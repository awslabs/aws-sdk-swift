//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

extension FileBasedConfiguration {
    actor Store {
        typealias ConfigurationProvider = (Sources) async throws -> FileBasedConfiguration?
        private let configurationForSources: ConfigurationProvider
        
        init(configurationProvider: @escaping ConfigurationProvider) {
            self.configurationForSources = configurationProvider
        }
        
        private var configurations: [FileBasedConfiguration.Sources: FileBasedConfiguration] = [:]
        private var activeTasks = [FileBasedConfiguration.Sources: Task<FileBasedConfiguration?, Error>]()
        
        /// Returns the file based configuration for the provided options.
        /// If the confiugration has already been loaded, then this simply returns that same configuration
        /// Otherwise it will attempt to load the configuration, store the result, and return it.
        public func configuration(for sources: Sources) async throws -> FileBasedConfiguration? {
            if let existingTask = activeTasks[sources] {
                return try await existingTask.value
            }
            
            let task = Task<FileBasedConfiguration?, Error> {
                if let existingConfig = configurations[sources] {
                    activeTasks[sources] = nil
                    return existingConfig
                }
                
                do {
                    let config = try await configurationForSources(sources)
                    configurations[sources] = config
                    activeTasks[sources] = nil
                    return config
                } catch {
                    activeTasks[sources] = nil
                    throw error
                }
            }
            
            activeTasks[sources] = task
            return try await task.value
        }
    }
}
