# GroundStationClient

``` swift
public class GroundStationClient 
```

## Inheritance

[`GroundStationClientProtocol`](/aws-sdk-swift/reference/0.x/AWSGroundStation/GroundStationClientProtocol)

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
public static let clientName = "GroundStationClient"
```

## Methods

### `cancelContact(input:completion:)`

Cancels a contact with a specified contact ID.

``` swift
public func cancelContact(input: CancelContactInput, completion: @escaping (ClientRuntime.SdkResult<CancelContactOutputResponse, CancelContactOutputError>) -> Void)
```

### `createConfig(input:completion:)`

Creates a Config with the specified configData parameters. Only one type of configData can be specified.

``` swift
public func createConfig(input: CreateConfigInput, completion: @escaping (ClientRuntime.SdkResult<CreateConfigOutputResponse, CreateConfigOutputError>) -> Void)
```

### `createDataflowEndpointGroup(input:completion:)`

Creates a DataflowEndpoint group containing the specified list of DataflowEndpoint objects. The name field in each endpoint is used in your mission profile DataflowEndpointConfig to specify which endpoints to use during a contact. When a contact uses multiple DataflowEndpointConfig objects, each Config must match a DataflowEndpoint in the same group.

``` swift
public func createDataflowEndpointGroup(input: CreateDataflowEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreateDataflowEndpointGroupOutputResponse, CreateDataflowEndpointGroupOutputError>) -> Void)
```

### `createMissionProfile(input:completion:)`

Creates a mission profile. dataflowEdges is a list of lists of strings. Each lower level list of strings has two elements: a from ARN and a to ARN.

``` swift
public func createMissionProfile(input: CreateMissionProfileInput, completion: @escaping (ClientRuntime.SdkResult<CreateMissionProfileOutputResponse, CreateMissionProfileOutputError>) -> Void)
```

### `deleteConfig(input:completion:)`

Deletes a Config.

``` swift
public func deleteConfig(input: DeleteConfigInput, completion: @escaping (ClientRuntime.SdkResult<DeleteConfigOutputResponse, DeleteConfigOutputError>) -> Void)
```

### `deleteDataflowEndpointGroup(input:completion:)`

Deletes a dataflow endpoint group.

``` swift
public func deleteDataflowEndpointGroup(input: DeleteDataflowEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDataflowEndpointGroupOutputResponse, DeleteDataflowEndpointGroupOutputError>) -> Void)
```

### `deleteMissionProfile(input:completion:)`

Deletes a mission profile.

``` swift
public func deleteMissionProfile(input: DeleteMissionProfileInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMissionProfileOutputResponse, DeleteMissionProfileOutputError>) -> Void)
```

### `describeContact(input:completion:)`

Describes an existing contact.

``` swift
public func describeContact(input: DescribeContactInput, completion: @escaping (ClientRuntime.SdkResult<DescribeContactOutputResponse, DescribeContactOutputError>) -> Void)
```

### `getConfig(input:completion:)`

Returns Config information. Only one Config response can be returned.

``` swift
public func getConfig(input: GetConfigInput, completion: @escaping (ClientRuntime.SdkResult<GetConfigOutputResponse, GetConfigOutputError>) -> Void)
```

### `getDataflowEndpointGroup(input:completion:)`

Returns the dataflow endpoint group.

``` swift
public func getDataflowEndpointGroup(input: GetDataflowEndpointGroupInput, completion: @escaping (ClientRuntime.SdkResult<GetDataflowEndpointGroupOutputResponse, GetDataflowEndpointGroupOutputError>) -> Void)
```

### `getMinuteUsage(input:completion:)`

Returns the number of minutes used by account.

``` swift
public func getMinuteUsage(input: GetMinuteUsageInput, completion: @escaping (ClientRuntime.SdkResult<GetMinuteUsageOutputResponse, GetMinuteUsageOutputError>) -> Void)
```

### `getMissionProfile(input:completion:)`

Returns a mission profile.

``` swift
public func getMissionProfile(input: GetMissionProfileInput, completion: @escaping (ClientRuntime.SdkResult<GetMissionProfileOutputResponse, GetMissionProfileOutputError>) -> Void)
```

### `getSatellite(input:completion:)`

Returns a satellite.

``` swift
public func getSatellite(input: GetSatelliteInput, completion: @escaping (ClientRuntime.SdkResult<GetSatelliteOutputResponse, GetSatelliteOutputError>) -> Void)
```

### `listConfigs(input:completion:)`

Returns a list of Config objects.

``` swift
public func listConfigs(input: ListConfigsInput, completion: @escaping (ClientRuntime.SdkResult<ListConfigsOutputResponse, ListConfigsOutputError>) -> Void)
```

### `listContacts(input:completion:)`

Returns a list of contacts. If statusList contains AVAILABLE, the request must include groundStation, missionprofileArn, and satelliteArn.

``` swift
public func listContacts(input: ListContactsInput, completion: @escaping (ClientRuntime.SdkResult<ListContactsOutputResponse, ListContactsOutputError>) -> Void)
```

### `listDataflowEndpointGroups(input:completion:)`

Returns a list of DataflowEndpoint groups.

``` swift
public func listDataflowEndpointGroups(input: ListDataflowEndpointGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListDataflowEndpointGroupsOutputResponse, ListDataflowEndpointGroupsOutputError>) -> Void)
```

### `listGroundStations(input:completion:)`

Returns a list of ground stations.

``` swift
public func listGroundStations(input: ListGroundStationsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroundStationsOutputResponse, ListGroundStationsOutputError>) -> Void)
```

### `listMissionProfiles(input:completion:)`

Returns a list of mission profiles.

``` swift
public func listMissionProfiles(input: ListMissionProfilesInput, completion: @escaping (ClientRuntime.SdkResult<ListMissionProfilesOutputResponse, ListMissionProfilesOutputError>) -> Void)
```

### `listSatellites(input:completion:)`

Returns a list of satellites.

``` swift
public func listSatellites(input: ListSatellitesInput, completion: @escaping (ClientRuntime.SdkResult<ListSatellitesOutputResponse, ListSatellitesOutputError>) -> Void)
```

### `listTagsForResource(input:completion:)`

Returns a list of tags for a specified resource.

``` swift
public func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### `reserveContact(input:completion:)`

Reserves a contact using specified parameters.

``` swift
public func reserveContact(input: ReserveContactInput, completion: @escaping (ClientRuntime.SdkResult<ReserveContactOutputResponse, ReserveContactOutputError>) -> Void)
```

### `tagResource(input:completion:)`

Assigns a tag to a resource.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### `untagResource(input:completion:)`

Deassigns a resource tag.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### `updateConfig(input:completion:)`

Updates the Config used when scheduling contacts. Updating a Config will not update the execution parameters for existing future contacts scheduled with this Config.

``` swift
public func updateConfig(input: UpdateConfigInput, completion: @escaping (ClientRuntime.SdkResult<UpdateConfigOutputResponse, UpdateConfigOutputError>) -> Void)
```

### `updateMissionProfile(input:completion:)`

Updates a mission profile. Updating a mission profile will not update the execution parameters for existing future contacts.

``` swift
public func updateMissionProfile(input: UpdateMissionProfileInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMissionProfileOutputResponse, UpdateMissionProfileOutputError>) -> Void)
```
