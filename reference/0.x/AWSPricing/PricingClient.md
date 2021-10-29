# PricingClient

``` swift
public class PricingClient 
```

## Inheritance

[`PricingClientProtocol`](/aws-sdk-swift/reference/0.x/AWSPricing/PricingClientProtocol)

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
public static let clientName = "PricingClient"
```

## Methods

### `describeServices(input:completion:)`

Returns the metadata for one service or a list of the metadata for all services. Use this without a service code to get the service codes for all services. Use it with a service code, such as AmazonEC2, to get information specific to that service, such as the attribute names available for that service. For example, some of the attribute names available for EC2 are volumeType, maxIopsVolume, operation, locationType, and instanceCapacity10xlarge.

``` swift
public func describeServices(input: DescribeServicesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServicesOutputResponse, DescribeServicesOutputError>) -> Void)
```

### `getAttributeValues(input:completion:)`

Returns a list of attribute values. Attibutes are similar to the details in a Price List API offer file. For a list of available attributes, see [Offer File Definitions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/reading-an-offer.html#pps-defs) in the [Amazon Web Services Billing and Cost Management User Guide](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html).

``` swift
public func getAttributeValues(input: GetAttributeValuesInput, completion: @escaping (ClientRuntime.SdkResult<GetAttributeValuesOutputResponse, GetAttributeValuesOutputError>) -> Void)
```

### `getProducts(input:completion:)`

Returns a list of all products that match the filter criteria.

``` swift
public func getProducts(input: GetProductsInput, completion: @escaping (ClientRuntime.SdkResult<GetProductsOutputResponse, GetProductsOutputError>) -> Void)
```
