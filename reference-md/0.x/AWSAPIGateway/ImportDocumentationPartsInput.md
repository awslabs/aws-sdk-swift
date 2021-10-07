# ImportDocumentationPartsInput

Import documentation parts from an external (e.g., OpenAPI) definition file.

``` swift
public struct ImportDocumentationPartsInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(body:failOnWarnings:mode:restApiId:)`

``` swift
public init (
        body: ClientRuntime.Data? = nil,
        failOnWarnings: Swift.Bool = false,
        mode: ApiGatewayClientTypes.PutMode? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `body`

\[Required\] Raw byte array representing the to-be-imported documentation parts. To import from an OpenAPI file, this is a JSON object.
This member is required.

``` swift
public var body: ClientRuntime.Data?
```

### `failOnWarnings`

A query parameter to specify whether to rollback the documentation importation (true) or not (false) when a warning is encountered. The default value is false.

``` swift
public var failOnWarnings: Swift.Bool
```

### `mode`

A query parameter to indicate whether to overwrite (OVERWRITE) any existing DocumentationParts definition or to merge (MERGE) the new definition into the existing one. The default value is MERGE.

``` swift
public var mode: ApiGatewayClientTypes.PutMode?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
