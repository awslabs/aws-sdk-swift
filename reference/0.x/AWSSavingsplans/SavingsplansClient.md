# SavingsplansClient

``` swift
public class SavingsplansClient 
```

## Inheritance

[`SavingsplansClientProtocol`](/aws-sdk-swift/reference/0.x/AWSSavingsplans/SavingsplansClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `createSavingsPlan(input:completion:)`

Creates a Savings Plan.

``` swift
public func createSavingsPlan(input: CreateSavingsPlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateSavingsPlanOutputResponse, CreateSavingsPlanOutputError>) -> Void)
```

### `deleteQueuedSavingsPlan(input:completion:)`

Deletes the queued purchase for the specified Savings Plan.

``` swift
public func deleteQueuedSavingsPlan(input: DeleteQueuedSavingsPlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteQueuedSavingsPlanOutputResponse, DeleteQueuedSavingsPlanOutputError>) -> Void)
```

### `describeSavingsPlanRates(input:completion:)`

Describes the specified Savings Plans rates.

``` swift
public func describeSavingsPlanRates(input: DescribeSavingsPlanRatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlanRatesOutputResponse, DescribeSavingsPlanRatesOutputError>) -> Void)
```

### `describeSavingsPlans(input:completion:)`

Describes the specified Savings Plans.

``` swift
public func describeSavingsPlans(input: DescribeSavingsPlansInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlansOutputResponse, DescribeSavingsPlansOutputError>) -> Void)
```

### `describeSavingsPlansOfferingRates(input:completion:)`

Describes the specified Savings Plans offering rates.

``` swift
public func describeSavingsPlansOfferingRates(input: DescribeSavingsPlansOfferingRatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlansOfferingRatesOutputResponse, DescribeSavingsPlansOfferingRatesOutputError>) -> Void)
```

### `describeSavingsPlansOfferings(input:completion:)`

Describes the specified Savings Plans offerings.

``` swift
public func describeSavingsPlansOfferings(input: DescribeSavingsPlansOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlansOfferingsOutputResponse, DescribeSavingsPlansOfferingsOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Lists the tags for the specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Adds the specified tags to the specified resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Removes the specified tags from the specified resource.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
