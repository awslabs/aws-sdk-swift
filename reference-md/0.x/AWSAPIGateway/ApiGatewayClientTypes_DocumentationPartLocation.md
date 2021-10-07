# ApiGatewayClientTypes.DocumentationPartLocation

Specifies the target API entity to which the documentation applies.

``` swift
public struct DocumentationPartLocation: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(method:name:path:statusCode:type:)`

``` swift
public init (
            method: Swift.String? = nil,
            name: Swift.String? = nil,
            path: Swift.String? = nil,
            statusCode: Swift.String? = nil,
            type: ApiGatewayClientTypes.DocumentationPartType? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `method`

The HTTP verb of a method. It is a valid field for the API entity types of  METHOD, PATH\_PARAMETER, QUERY\_PARAMETER, REQUEST\_HEADER,  REQUEST\_BODY, RESPONSE, RESPONSE\_HEADER, and RESPONSE\_BODY. The default value is \* for any method.  When an applicable child entity inherits the content of an entity of the same type with more general specifications of the other location attributes,  the child entity's method attribute must match that of the parent entity exactly.

``` swift
public var method: Swift.String?
```

### `name`

The name of the targeted API entity. It is a valid and required field for the API entity types of AUTHORIZER, MODEL, PATH\_PARAMETER, QUERY\_PARAMETER, REQUEST\_HEADER, REQUEST\_BODY and RESPONSE\_HEADER. It is an invalid field for any other entity type.

``` swift
public var name: Swift.String?
```

### `path`

The URL path of the target. It is a valid field for the API entity types of RESOURCE, METHOD, PATH\_PARAMETER, QUERY\_PARAMETER, REQUEST\_HEADER, REQUEST\_BODY, RESPONSE, RESPONSE\_HEADER, and RESPONSE\_BODY. The default value is / for the root resource. When an applicable child entity inherits the content of another entity of the same type with more general specifications of the other location attributes,  the child entity's path attribute must match that of the parent entity as a prefix.

``` swift
public var path: Swift.String?
```

### `statusCode`

The HTTP status code of a response. It is a valid field for the API entity types of RESPONSE, RESPONSE\_HEADER, and RESPONSE\_BODY. The default value is \* for any status code. When an applicable child  entity inherits the content of an entity of the same type with more general specifications of the other location attributes, the child entity's statusCode attribute must match that of the parent entity exactly.

``` swift
public var statusCode: Swift.String?
```

### `type`

\[Required\] The type of API entity to which the documentation content applies. Valid values are API, AUTHORIZER, MODEL, RESOURCE, METHOD, PATH\_PARAMETER, QUERY\_PARAMETER, REQUEST\_HEADER,  REQUEST\_BODY, RESPONSE, RESPONSE\_HEADER, and RESPONSE\_BODY. Content inheritance does not apply to any entity of the API, AUTHORIZER, METHOD,  MODEL, REQUEST\_BODY, or RESOURCE type.
This member is required.

``` swift
public var type: ApiGatewayClientTypes.DocumentationPartType?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
