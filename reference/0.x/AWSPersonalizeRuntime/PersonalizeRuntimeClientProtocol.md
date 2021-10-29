# PersonalizeRuntimeClientProtocol

``` swift
public protocol PersonalizeRuntimeClientProtocol 
```

## Requirements

### getPersonalizedRanking(input:completion:)

Re-ranks a list of recommended items for the given user. The first item in the list is deemed the most likely item to be of interest to the user. The solution backing the campaign must have been created using a recipe of type PERSONALIZED\_RANKING.

``` swift
func getPersonalizedRanking(input: GetPersonalizedRankingInput, completion: @escaping (ClientRuntime.SdkResult<GetPersonalizedRankingOutputResponse, GetPersonalizedRankingOutputError>) -> Void)
```

### getRecommendations(input:completion:)

Returns a list of recommended items. The required input depends on the recipe type used to create the solution backing the campaign, as follows:

``` swift
func getRecommendations(input: GetRecommendationsInput, completion: @escaping (ClientRuntime.SdkResult<GetRecommendationsOutputResponse, GetRecommendationsOutputError>) -> Void)
```

  - RELATED\_ITEMS - itemId required, userId not used

  - USER\_PERSONALIZATION - itemId optional, userId required

Campaigns that are backed by a solution created using a recipe of type PERSONALIZED\_RANKING use the API.
