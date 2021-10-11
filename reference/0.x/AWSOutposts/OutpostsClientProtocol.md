# OutpostsClientProtocol

AWS Outposts is a fully managed service that extends AWS infrastructure, APIs, and tools
to customer premises. By providing local access to AWS managed infrastructure, AWS Outposts
enables customers to build and run applications on premises using the same programming
interfaces as in AWS Regions, while using local compute and storage resources for lower
latency and local data processing needs.

``` swift
public protocol OutpostsClientProtocol 
```

## Requirements

### createOrder(input:​completion:​)

Creates an order for an Outpost.

``` swift
func createOrder(input: CreateOrderInput, completion: @escaping (ClientRuntime.SdkResult<CreateOrderOutputResponse, CreateOrderOutputError>) -> Void)
```

### createOutpost(input:​completion:​)

Creates an Outpost.
You can specify AvailabilityZone or AvailabilityZoneId.

``` swift
func createOutpost(input: CreateOutpostInput, completion: @escaping (ClientRuntime.SdkResult<CreateOutpostOutputResponse, CreateOutpostOutputError>) -> Void)
```

### deleteOutpost(input:​completion:​)

Deletes the Outpost.

``` swift
func deleteOutpost(input: DeleteOutpostInput, completion: @escaping (ClientRuntime.SdkResult<DeleteOutpostOutputResponse, DeleteOutpostOutputError>) -> Void)
```

### deleteSite(input:​completion:​)

Deletes the site.

``` swift
func deleteSite(input: DeleteSiteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSiteOutputResponse, DeleteSiteOutputError>) -> Void)
```

### getOutpost(input:​completion:​)

Gets information about the specified Outpost.

``` swift
func getOutpost(input: GetOutpostInput, completion: @escaping (ClientRuntime.SdkResult<GetOutpostOutputResponse, GetOutpostOutputError>) -> Void)
```

### getOutpostInstanceTypes(input:​completion:​)

Lists the instance types for the specified Outpost.

``` swift
func getOutpostInstanceTypes(input: GetOutpostInstanceTypesInput, completion: @escaping (ClientRuntime.SdkResult<GetOutpostInstanceTypesOutputResponse, GetOutpostInstanceTypesOutputError>) -> Void)
```

### listOutposts(input:​completion:​)

Create a list of the Outposts for your AWS account. Add filters to your request to return
a more specific list of results. Use filters to match an Outpost lifecycle status,
Availibility Zone (us-east-1a), and AZ ID (use1-az1).

``` swift
func listOutposts(input: ListOutpostsInput, completion: @escaping (ClientRuntime.SdkResult<ListOutpostsOutputResponse, ListOutpostsOutputError>) -> Void)
```

``` 
     If you specify multiple filters, the filters are joined with an AND, and the request returns only
  results that match all of the specified filters.
```

### listSites(input:​completion:​)

Lists the sites for the specified AWS account.

``` swift
func listSites(input: ListSitesInput, completion: @escaping (ClientRuntime.SdkResult<ListSitesOutputResponse, ListSitesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Lists the tags for the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds tags to the specified resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from the specified resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
