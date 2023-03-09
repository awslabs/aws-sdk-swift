import Foundation

struct Error: LocalizedError {
    var message: String
    var errorDescription: String? { message }
    
    init(_ message: String) {
        self.message = message
    }
}
