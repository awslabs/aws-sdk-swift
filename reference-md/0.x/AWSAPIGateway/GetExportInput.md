# GetExportInput

Request a new export of a RestApi for a particular Stage.

``` swift
public struct GetExportInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(accepts:exportType:parameters:restApiId:stageName:)`

``` swift
public init (
        accepts: Swift.String? = nil,
        exportType: Swift.String? = nil,
        parameters: [Swift.String:Swift.String]? = nil,
        restApiId: Swift.String? = nil,
        stageName: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `accepts`

The content-type of the export, for example application/json. Currently application/json and application/yaml are supported for exportType ofoas30 and swagger. This should be specified in the Accept header for direct API requests.

``` swift
public var accepts: Swift.String?
```

### `exportType`

\[Required\] The type of export. Acceptable values are 'oas30' for OpenAPI 3.0.x and 'swagger' for Swagger/OpenAPI 2.0.
This member is required.

``` swift
public var exportType: Swift.String?
```

### `parameters`

A key-value map of query string parameters that specify properties of the export, depending on the requested exportType. For exportType oas30 and swagger, any combination of the following parameters are supported:​ extensions='integrations' or extensions='apigateway' will export the API with x-amazon-apigateway-integration extensions. extensions='authorizers' will export the API with  x-amazon-apigateway-authorizer extensions. postman will export the API with Postman extensions, allowing for import to the Postman tool

``` swift
public var parameters: [Swift.String:Swift.String]?
```

### `restApiId`

\[Required\] The string identifier of the associated RestApi.
This member is required.

``` swift
public var restApiId: Swift.String?
```

### `stageName`

\[Required\] The name of the Stage that will be exported.
This member is required.

``` swift
public var stageName: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
