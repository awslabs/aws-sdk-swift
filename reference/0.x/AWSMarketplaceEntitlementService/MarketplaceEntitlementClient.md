# MarketplaceEntitlementClient

``` swift
public class MarketplaceEntitlementClient 
```

## Inheritance

[`MarketplaceEntitlementClientProtocol`](/aws-sdk-swift/reference/0.x/AWSMarketplaceEntitlementService/MarketplaceEntitlementClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Properties

### `clientName`

``` swift
public static let clientName = "MarketplaceEntitlementClient"
```

## Methods

### `getEntitlements(input:completion:)`

GetEntitlements retrieves entitlement values for a given product. The results can be filtered based on customer identifier or product dimensions.

``` swift
public func getEntitlements(input: GetEntitlementsInput, completion: @escaping (ClientRuntime.SdkResult<GetEntitlementsOutputResponse, GetEntitlementsOutputError>) -> Void)
```
