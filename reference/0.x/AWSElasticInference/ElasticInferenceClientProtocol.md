# ElasticInferenceClientProtocol

Elastic Inference public APIs.

``` swift
public protocol ElasticInferenceClientProtocol 
```

## Requirements

### describeAcceleratorOfferings(input:completion:)

Describes the locations in which a given accelerator type or set of types is present in a given region.

``` swift
func describeAcceleratorOfferings(input: DescribeAcceleratorOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAcceleratorOfferingsOutputResponse, DescribeAcceleratorOfferingsOutputError>) -> Void)
```

### describeAccelerators(input:completion:)

Describes information over a provided set of accelerators belonging to an account.

``` swift
func describeAccelerators(input: DescribeAcceleratorsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAcceleratorsOutputResponse, DescribeAcceleratorsOutputError>) -> Void)
```

### describeAcceleratorTypes(input:completion:)

Describes the accelerator types available in a given region, as well as their characteristics, such as memory and throughput.

``` swift
func describeAcceleratorTypes(input: DescribeAcceleratorTypesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAcceleratorTypesOutputResponse, DescribeAcceleratorTypesOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Returns all tags of an Elastic Inference Accelerator.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds the specified tags to an Elastic Inference Accelerator.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes the specified tags from an Elastic Inference Accelerator.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
