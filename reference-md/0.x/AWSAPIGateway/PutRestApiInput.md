# PutRestApiInput

A PUT request to update an existing API, with external API definitions specified as the request body.

``` swift
public struct PutRestApiInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(body:failOnWarnings:mode:parameters:restApiId:)`

``` swift
public init (
        body: ClientRuntime.Data? = nil,
        failOnWarnings: Swift.Bool = false,
        mode: ApiGatewayClientTypes.PutMode? = nil,
        parameters: [Swift.String:Swift.String]? = nil,
        restApiId: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `body`

\[Required\] The PUT request body containing external API definitions. Currently, only OpenAPI definition JSON/YAML files are supported. The maximum size of the API definition file is 6MB.
This member is required.

``` swift
public var body: ClientRuntime.Data?
```

### `failOnWarnings`

A query parameter to indicate whether to rollback the API update (true) or not (false)
when a warning is encountered. The default value is false.

``` swift
public var failOnWarnings: Swift.Bool
```

### `mode`

The mode query parameter to specify the update mode. Valid values are "merge" and "overwrite". By default,
the update mode is "merge".

``` swift
public var mode: ApiGatewayClientTypes.PutMode?
```

### `parameters`

Custom header parameters as part of the request. For example, to exclude DocumentationParts from an imported API, set ignore=documentation as a parameters value, as in the AWS CLI command of aws apigateway import-rest-api --parameters ignore=documentation --body 'file:​///path/to/imported-api-body.json'.

``` swift
public var parameters: [Swift.String:Swift.String]?
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
