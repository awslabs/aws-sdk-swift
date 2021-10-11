# PricingClientProtocol

Amazon Web Services Price List Service API (Amazon Web Services Price List Service) is a centralized and convenient way to
programmatically query Amazon Web Services for services, products, and pricing information. The Amazon Web Services Price List Service
uses standardized product attributes such as Location, Storage
Class, and Operating System, and provides prices at the SKU
level. You can use the Amazon Web Services Price List Service to build cost control and scenario planning tools, reconcile
billing data, forecast future spend for budgeting purposes, and provide cost benefit
analysis that compare your internal workloads with Amazon Web Services.
Use GetServices without a service code to retrieve the service codes for all AWS services, then
GetServices with a service code to retreive the attribute names for
that service. After you have the service code and attribute names, you can use GetAttributeValues
to see what values are available for an attribute. With the service code and an attribute name and value,
you can use GetProducts to find specific products that you're interested in, such as
an AmazonEC2 instance, with a Provisioned IOPS
volumeType.
Service Endpoint
Amazon Web Services Price List Service API provides the following two endpoints:​

``` swift
public protocol PricingClientProtocol 
```

``` 
           https://api.pricing.us-east-1.amazonaws.com


           https://api.pricing.ap-south-1.amazonaws.com
```

## Requirements

### describeServices(input:​completion:​)

Returns the metadata for one service or a list of the metadata for all services. Use
this without a service code to get the service codes for all services.
Use it with a service code, such as AmazonEC2, to get information specific to
that service, such as the attribute
names available for that service. For example, some of the attribute names available for EC2 are
volumeType, maxIopsVolume, operation,
locationType, and instanceCapacity10xlarge.

``` swift
func describeServices(input: DescribeServicesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServicesOutputResponse, DescribeServicesOutputError>) -> Void)
```

### getAttributeValues(input:​completion:​)

Returns a list of attribute values. Attibutes are similar to the details
in a Price List API offer file. For a list of available attributes, see
<a href="https:​//docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/reading-an-offer.html#pps-defs">Offer File Definitions
in the <a href="https:​//docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html">Amazon Web Services Billing and Cost Management User Guide.

``` swift
func getAttributeValues(input: GetAttributeValuesInput, completion: @escaping (ClientRuntime.SdkResult<GetAttributeValuesOutputResponse, GetAttributeValuesOutputError>) -> Void)
```

### getProducts(input:​completion:​)

Returns a list of all products that match the filter criteria.

``` swift
func getProducts(input: GetProductsInput, completion: @escaping (ClientRuntime.SdkResult<GetProductsOutputResponse, GetProductsOutputError>) -> Void)
```
