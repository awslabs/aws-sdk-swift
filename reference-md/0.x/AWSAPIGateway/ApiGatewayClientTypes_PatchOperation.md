# ApiGatewayClientTypes.PatchOperation

A single patch operation to apply to the specified resource. Please refer to
http:​//tools.ietf.org/html/rfc6902\#section-4 for an explanation of how each operation is used.

``` swift
public struct PatchOperation: Swift.Equatable 
```

## Inheritance

`ClientRuntime.Reflection`, `Swift.Codable`, `Swift.CustomDebugStringConvertible`, `Swift.Equatable`

## Initializers

### `init(from:)`

``` swift
public init (from decoder: Swift.Decoder) throws 
```

### `init(from:op:path:value:)`

``` swift
public init (
            from: Swift.String? = nil,
            op: ApiGatewayClientTypes.Op? = nil,
            path: Swift.String? = nil,
            value: Swift.String? = nil
        )
```

## Properties

### `debugDescription`

``` swift
public var debugDescription: Swift.String 
```

### `from`

The copy update operation's source as identified by a JSON-Pointer value referencing the location within the targeted resource to copy the value from. For example, to promote a canary deployment, you copy the canary deployment ID to the affiliated deployment ID by calling a PATCH request on a Stage resource with "op":​"copy", "from":​"/canarySettings/deploymentId" and "path":​"/deploymentId".

``` swift
public var from: Swift.String?
```

### `op`

An update operation to be performed with this PATCH request. The valid value can be add, remove,  replace or copy. Not all valid operations are supported for a given resource. Support of the operations depends on specific operational contexts. Attempts to apply an unsupported operation on a resource will return an error message.

``` swift
public var op: ApiGatewayClientTypes.Op?
```

### `path`

The op operation's target, as identified by a <a href="https:​//tools.ietf.org/html/draft-ietf-appsawg-json-pointer-08">JSON Pointer value that references a location within the targeted resource. For example, if the target resource has an updateable property of {"name":​"value"}, the path for this property is /name. If the name property value is a JSON object (e.g., {"name":​ {"child/name":​ "child-value"}}), the path for the child/name property will be /name/child~1name. Any slash ("/") character appearing in path names must be escaped with "~1", as shown in the example above. Each op operation can have only one path associated with it.

``` swift
public var path: Swift.String?
```

### `value`

The new target value of the update operation. It is applicable for the add or replace operation. When using AWS CLI to update a property of a JSON value, enclose the JSON object with a pair of single quotes in a Linux shell, e.g., '{"a":​ ...}'. In a Windows shell, see <a href="https:​//docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using JSON for Parameters.

``` swift
public var value: Swift.String?
```

## Methods

### `encode(to:)`

``` swift
public func encode(to encoder: Swift.Encoder) throws 
```
