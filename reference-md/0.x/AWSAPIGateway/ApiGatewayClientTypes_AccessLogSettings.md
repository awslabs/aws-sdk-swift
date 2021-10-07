# ApiGatewayClientTypes.AccessLogSettings

Access log settings, including the access log format and access log destination ARN.

``` swift
public struct AccessLogSettings: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(destinationArn:format:)`

``` swift
public init (
            destinationArn: Swift.String? = nil,
            format: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `destinationArn`

The Amazon Resource Name (ARN) of the CloudWatch Logs log group or Kinesis Data Firehose delivery stream to receive access logs. If you specify a Kinesis Data Firehose delivery stream, the stream name must begin with amazon-apigateway-.

``` swift
public var destinationArn: Swift.String?
```

### `format`

A single line format of the access logs of data, as specified by selected <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html#context-variable-reference">$context variables. The format must include at least $context.requestId.

``` swift
public var format: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
