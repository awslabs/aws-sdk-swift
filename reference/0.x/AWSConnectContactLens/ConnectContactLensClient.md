# ConnectContactLensClient

``` swift
public class ConnectContactLensClient 
```

## Inheritance

[`ConnectContactLensClientProtocol`](/aws-sdk-swift/reference/0.x/AWSConnectContactLens/ConnectContactLensClientProtocol)

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

### `listRealtimeContactAnalysisSegments(input:completion:)`

Provides a list of analysis segments for a real-time analysis session.

``` swift
public func listRealtimeContactAnalysisSegments(input: ListRealtimeContactAnalysisSegmentsInput, completion: @escaping (ClientRuntime.SdkResult<ListRealtimeContactAnalysisSegmentsOutputResponse, ListRealtimeContactAnalysisSegmentsOutputError>) -> Void)
```
