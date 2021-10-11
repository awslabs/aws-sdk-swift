# PersonalizeRuntimeClient

``` swift
public class PersonalizeRuntimeClient 
```

## Inheritance

[`PersonalizeRuntimeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSPersonalizeRuntime/PersonalizeRuntimeClientProtocol)

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

### `getPersonalizedRanking(input:completion:)`

Re-ranks a list of recommended items for the given user. The first item in the list is
deemed the most likely item to be of interest to the user.

``` swift
public func getPersonalizedRanking(input: GetPersonalizedRankingInput, completion: @escaping (ClientRuntime.SdkResult<GetPersonalizedRankingOutputResponse, GetPersonalizedRankingOutputError>) -> Void)
```

``` 
        The solution backing the campaign must have been created using a recipe of type
    PERSONALIZED_RANKING.
```

### `getRecommendations(input:completion:)`

Returns a list of recommended items. The required input depends on the recipe type used to
create the solution backing the campaign, as follows:​

``` swift
public func getRecommendations(input: GetRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommendationsOutputResponse, GetRecommendationsOutputError>) -> Void)
```

``` 
           RELATED_ITEMS - itemId required, userId not used


           USER_PERSONALIZATION - itemId optional, userId
      required



        Campaigns that are backed by a solution created using a recipe of type
    PERSONALIZED_RANKING use the  API.
```
