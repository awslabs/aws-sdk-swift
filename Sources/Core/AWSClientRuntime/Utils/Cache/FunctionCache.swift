//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// A cache that provides function memoization.
/// The cache stores the outputs of the provided function call and returns the cached output when given the same input again.
/// If the function call throws an error, its not cached.
actor FunctionCache<Input: Hashable, Output> {
    typealias Function = (Input) async throws -> Output
    private let f: Function

    // Future Improvement:
    // Allow for the cache type and instance to be injected in,
    // this would allow composers to specify the type of backing cache that they need.
    // For example, some uses cases might call for something like NSCache that will auto-evict
    // resources when the system is low on memory.
    private var cache = [Input: Output]()
    private var activeTasks = [Input: Task<Output, Error>]()

    /// Creates a function cache that will store the outputs of the provided function.
    init(_ f: @escaping Function) {
        self.f = f
    }
}

extension FunctionCache {
    /// Returns the `Output` by retrieving the value from the cache or executing the function using the provided input.
    /// If an output exists in the cache for the provided input, it returns that.
    /// Otherwise it executes the function (provided in the initailizer), stores the output in the cache, and then returns it.
    ///
    /// Only one function execution will occur for the same input, even if concurrent calls are made the same input.
    ///
    /// - Parameter input: The input uses to retrieve the output from the cache or passed to the function for execution.
    /// - Returns: The `Output` by retrieving the value from the cache or executing the function using the provided input.
    func output(for input: Input) async throws -> Output {
        // Check if we have a task already scheduled for the input
        if let existingTask = activeTasks[input] {
            // We have an existing task scheduled for the input, so await its value
            return try await existingTask.value
        }

        // Check if we have an output cached for the input
        if let existingOutput = cache[input] {
            // We have an output cached for the input, so return that
            return existingOutput
        }

        // Create a task that handles performing the work
        // It will execute the function and store the output in the cache.
        let task = Task<Output, Error> {
            do {
                // Execute the function passing in the input
                let output = try await f(input)
                // Insert the output into the cache
                cache[input] = output
                // Untrack the task
                activeTasks[input] = nil
                // Return the output
                return output
            } catch {
                // Untrack the task
                activeTasks[input] = nil
                throw error
            }
        }

        // Keep track of the task
        // This allows us to use this same task if another call is made with the same input
        // before the function finishes executing.
        activeTasks[input] = task

        // Await the task and return it's value
        return try await task.value
    }
}

