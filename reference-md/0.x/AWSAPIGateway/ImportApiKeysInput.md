# ImportApiKeysInput

The POST request to import API keys from an external source, such as a CSV-formatted file.

``` swift
public struct ImportApiKeysInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(body:failOnWarnings:format:)`

``` swift
public init (
        body: ClientRuntime.Data? = nil,
        failOnWarnings: Swift.Bool = false,
        format: ApiGatewayClientTypes.ApiKeysFormat? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `body`

The payload of the POST request to import API keys. For the payload format, see <a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/api-key-file-format.html">API Key File Format.
This member is required.

``` swift
public var body: ClientRuntime.Data?
```

### `failOnWarnings`

A query parameter to indicate whether to rollback ApiKey importation (true) or not (false) when error is encountered.

``` swift
public var failOnWarnings: Swift.Bool
```

### `format`

A query parameter to specify the input format to imported API keys. Currently, only the csv format is supported.
This member is required.

``` swift
public var format: ApiGatewayClientTypes.ApiKeysFormat?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
