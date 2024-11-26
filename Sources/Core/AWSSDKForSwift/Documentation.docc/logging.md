# Logging

The AWS SDK for Swift uses SwiftLog for high performant logging.  Many of our calls are issued to the `debug` level of output, which are disabled in the console by default.  To see debug output to your console, you can add the following code to your application in a place where you know that the code will be called once and only once:
```swift
import ClientRuntime
await SDKLoggingSystem().initialize(logLevel: .debug)
```

Alternatively, if you need finer grain control of instances of SwiftLog, you can call `SDKLoggingSystem::add` to control specific instances of the log handler.  For example:
```swift
import ClientRuntime

let loggingSystem = SDKLoggingSystem()

// Adds custom log handler for S3Client so that only .debug or severe leveled messages get logged for S3Client.
await loggingSystem.addLogHandlerFactory(logHandlerFactory: S3ClientLogHandlerFactory(logLevel: .debug))
await loggingSystem.initialize()

// Example implementation of a service-specific log handler factory.
public struct S3ClientLogHandlerFactory: SDKLogHandlerFactory {
    // This label value must be the name of the service client you want the log handler to apply to.
    public var label = "S3Client"
    let logLevel: Logger.Level

    public func construct(label: String) -> LogHandler {
        var handler = StreamLogHandler.standardOutput(label: label)
        handler.logLevel = logLevel
        return handler
    }

    public init(logLevel: Logger.Level) {
        self.logLevel = logLevel
    }
}
```
