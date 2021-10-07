# ImportRestApiInput

A POST request to import an API to API Gateway using an input of an API definition file.

``` swift
public struct ImportRestApiInput: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.CustomDebugStringConvertible`, `Swift.Encodable`, `Swift.Equatable`

## Initializers

### `init(body:failOnWarnings:parameters:)`

``` swift
public init (
        body: ClientRuntime.Data? = nil,
        failOnWarnings: Swift.Bool = false,
        parameters: [Swift.String:Swift.String]? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `body`

\[Required\] The POST request body containing external API definitions. Currently, only OpenAPI definition JSON/YAML files are supported. The maximum size of the API definition file is 6MB.
This member is required.

``` swift
public var body: ClientRuntime.Data?
```

### `failOnWarnings`

A query parameter to indicate whether to rollback the API creation (true) or not (false)
when a warning is encountered. The default value is false.

``` swift
public var failOnWarnings: Swift.Bool
```

### `parameters`

A key-value map of context-specific query string parameters specifying the behavior of different API importing operations. The following shows operation-specific parameters and their supported values.
To exclude DocumentationParts from the import, set parameters as ignore=documentation.
To configure the endpoint type, set parameters as endpointConfigurationTypes=EDGE, endpointConfigurationTypes=REGIONAL, or endpointConfigurationTypes=PRIVATE. The default endpoint type is EDGE.
To handle imported basepath, set parameters as basepath=ignore, basepath=prepend or basepath=split.
For example, the AWS CLI command to exclude documentation from the imported API is:​

<pre>aws apigateway import-rest-api --parameters ignore=documentation --body 'file:​///path/to/imported-api-body.json'</pre>

The AWS CLI command to set the regional endpoint on the imported API is:​

<pre>aws apigateway import-rest-api --parameters endpointConfigurationTypes=REGIONAL --body 'file:​///path/to/imported-api-body.json'</pre>

``` swift
public var parameters: [Swift.String:Swift.String]?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
