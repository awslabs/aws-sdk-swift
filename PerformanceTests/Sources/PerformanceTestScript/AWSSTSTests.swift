import AWSSTS
import Foundation

final class AWSSTSTests {
    static func getCallerIdentity() async throws -> Double {
        let start = Date()
        let client = try STSClient(region: "us-west-2")
        _ = try await client.getCallerIdentity(input: .init())
        return Date().timeIntervalSince(start) * 1000  // Convert seconds to milliseconds
    }
}
