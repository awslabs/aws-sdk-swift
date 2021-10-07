# GetModelTemplateOutputResponse

Represents a mapping template used to transform a payload.

<div class="seeAlso">
<a href="https:​//docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html#models-mappings-mappings">Mapping Templates
</div>

``` swift
public struct GetModelTemplateOutputResponse: Swift.Equatable 
```

## Inheritance

`ClientRuntime.HttpResponseBinding`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(httpResponse:decoder:)`

``` swift
public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws 
```

### `init(value:)`

``` swift
public init (
        value: Swift.String? = nil
    )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `value`

The Apache <a target="_blank" href="https:​//velocity.apache.org/engine/devel/vtl-reference.html">Velocity Template Language (VTL) template content used for the template resource.

``` swift
public var value: Swift.String?
```
