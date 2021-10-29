# SavingsplansClientProtocol

Savings Plans are a pricing model that offer significant savings on AWS usage (for example, on Amazon EC2 instances). You commit to a consistent amount of usage, in USD per hour, for a term of 1 or 3 years, and receive a lower price for that usage. For more information, see the [AWS Savings Plans User Guide](https://docs.aws.amazon.com/savingsplans/latest/userguide/).

``` swift
public protocol SavingsplansClientProtocol 
```

## Requirements

### createSavingsPlan(input:completion:)

Creates a Savings Plan.

``` swift
func createSavingsPlan(input: CreateSavingsPlanInput, completion: @escaping (ClientRuntime.SdkResult<CreateSavingsPlanOutputResponse, CreateSavingsPlanOutputError>) -> Void)
```

### deleteQueuedSavingsPlan(input:completion:)

Deletes the queued purchase for the specified Savings Plan.

``` swift
func deleteQueuedSavingsPlan(input: DeleteQueuedSavingsPlanInput, completion: @escaping (ClientRuntime.SdkResult<DeleteQueuedSavingsPlanOutputResponse, DeleteQueuedSavingsPlanOutputError>) -> Void)
```

### describeSavingsPlanRates(input:completion:)

Describes the specified Savings Plans rates.

``` swift
func describeSavingsPlanRates(input: DescribeSavingsPlanRatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlanRatesOutputResponse, DescribeSavingsPlanRatesOutputError>) -> Void)
```

### describeSavingsPlans(input:completion:)

Describes the specified Savings Plans.

``` swift
func describeSavingsPlans(input: DescribeSavingsPlansInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlansOutputResponse, DescribeSavingsPlansOutputError>) -> Void)
```

### describeSavingsPlansOfferingRates(input:completion:)

Describes the specified Savings Plans offering rates.

``` swift
func describeSavingsPlansOfferingRates(input: DescribeSavingsPlansOfferingRatesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlansOfferingRatesOutputResponse, DescribeSavingsPlansOfferingRatesOutputError>) -> Void)
```

### describeSavingsPlansOfferings(input:completion:)

Describes the specified Savings Plans offerings.

``` swift
func describeSavingsPlansOfferings(input: DescribeSavingsPlansOfferingsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSavingsPlansOfferingsOutputResponse, DescribeSavingsPlansOfferingsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Lists the tags for the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:completion:)

Adds the specified tags to the specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes the specified tags from the specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
