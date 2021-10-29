# LocationClientProtocol

Suite of geospatial services including Maps, Places, Routes, Tracking, and Geofencing

``` swift
public protocol LocationClientProtocol 
```

## Requirements

### associateTrackerConsumer(input:completion:)

Creates an association between a geofence collection and a tracker resource. This allows the tracker resource to communicate location data to the linked geofence collection. You can associate up to five geofence collections to each tracker resource. Currently not supported — Cross-account configurations, such as creating associations between a tracker resource in one account and a geofence collection in another account.

``` swift
func associateTrackerConsumer(input: AssociateTrackerConsumerInput, completion: @escaping (ClientRuntime.SdkResult<AssociateTrackerConsumerOutputResponse, AssociateTrackerConsumerOutputError>) -> Void)
```

### batchDeleteDevicePositionHistory(input:completion:)

Deletes the position history of one or more devices from a tracker resource.

``` swift
func batchDeleteDevicePositionHistory(input: BatchDeleteDevicePositionHistoryInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteDevicePositionHistoryOutputResponse, BatchDeleteDevicePositionHistoryOutputError>) -> Void)
```

### batchDeleteGeofence(input:completion:)

Deletes a batch of geofences from a geofence collection. This operation deletes the resource permanently.

``` swift
func batchDeleteGeofence(input: BatchDeleteGeofenceInput, completion: @escaping (ClientRuntime.SdkResult<BatchDeleteGeofenceOutputResponse, BatchDeleteGeofenceOutputError>) -> Void)
```

### batchEvaluateGeofences(input:completion:)

Evaluates device positions against the geofence geometries from a given geofence collection. This operation always returns an empty response because geofences are asynchronously evaluated. The evaluation determines if the device has entered or exited a geofenced area, and then publishes one of the following events to Amazon EventBridge:

``` swift
func batchEvaluateGeofences(input: BatchEvaluateGeofencesInput, completion: @escaping (ClientRuntime.SdkResult<BatchEvaluateGeofencesOutputResponse, BatchEvaluateGeofencesOutputError>) -> Void)
```

  - ENTER if Amazon Location determines that the tracked device has entered a geofenced area.

  - EXIT if Amazon Location determines that the tracked device has exited a geofenced area.

The last geofence that a device was observed within is tracked for 30 days after the most recent device position update.

### batchGetDevicePosition(input:completion:)

Lists the latest device positions for requested devices.

``` swift
func batchGetDevicePosition(input: BatchGetDevicePositionInput, completion: @escaping (ClientRuntime.SdkResult<BatchGetDevicePositionOutputResponse, BatchGetDevicePositionOutputError>) -> Void)
```

### batchPutGeofence(input:completion:)

A batch request for storing geofence geometries into a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request.

``` swift
func batchPutGeofence(input: BatchPutGeofenceInput, completion: @escaping (ClientRuntime.SdkResult<BatchPutGeofenceOutputResponse, BatchPutGeofenceOutputError>) -> Void)
```

### batchUpdateDevicePosition(input:completion:)

Uploads position update data for one or more devices to a tracker resource. Amazon Location uses the data when reporting the last known device position and position history. Only one position update is stored per sample time. Location data is sampled at a fixed rate of one position per 30-second interval and retained for 30 days before it's deleted.

``` swift
func batchUpdateDevicePosition(input: BatchUpdateDevicePositionInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdateDevicePositionOutputResponse, BatchUpdateDevicePositionOutputError>) -> Void)
```

### calculateRoute(input:completion:)

[Calculates a route](https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html) given the following required parameters: DeparturePostiton and DestinationPosition. Requires that you first [create a route calculator resource](https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html) By default, a request that doesn't specify a departure time uses the best time of day to travel with the best traffic conditions when calculating the route. Additional options include:

``` swift
func calculateRoute(input: CalculateRouteInput, completion: @escaping (ClientRuntime.SdkResult<CalculateRouteOutputResponse, CalculateRouteOutputError>) -> Void)
```

  - [Specifying a departure time](https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#departure-time) using either DepartureTime or DepartureNow. This calculates a route based on predictive traffic data at the given time. You can't specify both DepartureTime and DepartureNow in a single request. Specifying both parameters returns an error message.

  - [Specifying a travel mode](https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#travel-mode) using TravelMode. This lets you specify an additional route preference such as CarModeOptions if traveling by Car, or TruckModeOptions if traveling by Truck.

### createGeofenceCollection(input:completion:)

Creates a geofence collection, which manages and stores geofences.

``` swift
func createGeofenceCollection(input: CreateGeofenceCollectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateGeofenceCollectionOutputResponse, CreateGeofenceCollectionOutputError>) -> Void)
```

### createMap(input:completion:)

Creates a map resource in your AWS account, which provides map tiles of different styles sourced from global location data providers.

``` swift
func createMap(input: CreateMapInput, completion: @escaping (ClientRuntime.SdkResult<CreateMapOutputResponse, CreateMapOutputError>) -> Void)
```

### createPlaceIndex(input:completion:)

Creates a place index resource in your AWS account, which supports functions with geospatial data sourced from your chosen data provider.

``` swift
func createPlaceIndex(input: CreatePlaceIndexInput, completion: @escaping (ClientRuntime.SdkResult<CreatePlaceIndexOutputResponse, CreatePlaceIndexOutputError>) -> Void)
```

### createRouteCalculator(input:completion:)

Creates a route calculator resource in your AWS account. You can send requests to a route calculator resource to estimate travel time, distance, and get directions. A route calculator sources traffic and road network data from your chosen data provider.

``` swift
func createRouteCalculator(input: CreateRouteCalculatorInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteCalculatorOutputResponse, CreateRouteCalculatorOutputError>) -> Void)
```

### createTracker(input:completion:)

Creates a tracker resource in your AWS account, which lets you retrieve current and historical location of devices.

``` swift
func createTracker(input: CreateTrackerInput, completion: @escaping (ClientRuntime.SdkResult<CreateTrackerOutputResponse, CreateTrackerOutputError>) -> Void)
```

### deleteGeofenceCollection(input:completion:)

Deletes a geofence collection from your AWS account. This operation deletes the resource permanently. If the geofence collection is the target of a tracker resource, the devices will no longer be monitored.

``` swift
func deleteGeofenceCollection(input: DeleteGeofenceCollectionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGeofenceCollectionOutputResponse, DeleteGeofenceCollectionOutputError>) -> Void)
```

### deleteMap(input:completion:)

Deletes a map resource from your AWS account. This operation deletes the resource permanently. If the map is being used in an application, the map may not render.

``` swift
func deleteMap(input: DeleteMapInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMapOutputResponse, DeleteMapOutputError>) -> Void)
```

### deletePlaceIndex(input:completion:)

Deletes a place index resource from your AWS account. This operation deletes the resource permanently.

``` swift
func deletePlaceIndex(input: DeletePlaceIndexInput, completion: @escaping (ClientRuntime.SdkResult<DeletePlaceIndexOutputResponse, DeletePlaceIndexOutputError>) -> Void)
```

### deleteRouteCalculator(input:completion:)

Deletes a route calculator resource from your AWS account. This operation deletes the resource permanently.

``` swift
func deleteRouteCalculator(input: DeleteRouteCalculatorInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteCalculatorOutputResponse, DeleteRouteCalculatorOutputError>) -> Void)
```

### deleteTracker(input:completion:)

Deletes a tracker resource from your AWS account. This operation deletes the resource permanently. If the tracker resource is in use, you may encounter an error. Make sure that the target resource isn't a dependency for your applications.

``` swift
func deleteTracker(input: DeleteTrackerInput, completion: @escaping (ClientRuntime.SdkResult<DeleteTrackerOutputResponse, DeleteTrackerOutputError>) -> Void)
```

### describeGeofenceCollection(input:completion:)

Retrieves the geofence collection details.

``` swift
func describeGeofenceCollection(input: DescribeGeofenceCollectionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGeofenceCollectionOutputResponse, DescribeGeofenceCollectionOutputError>) -> Void)
```

### describeMap(input:completion:)

Retrieves the map resource details.

``` swift
func describeMap(input: DescribeMapInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMapOutputResponse, DescribeMapOutputError>) -> Void)
```

### describePlaceIndex(input:completion:)

Retrieves the place index resource details.

``` swift
func describePlaceIndex(input: DescribePlaceIndexInput, completion: @escaping (ClientRuntime.SdkResult<DescribePlaceIndexOutputResponse, DescribePlaceIndexOutputError>) -> Void)
```

### describeRouteCalculator(input:completion:)

Retrieves the route calculator resource details.

``` swift
func describeRouteCalculator(input: DescribeRouteCalculatorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRouteCalculatorOutputResponse, DescribeRouteCalculatorOutputError>) -> Void)
```

### describeTracker(input:completion:)

Retrieves the tracker resource details.

``` swift
func describeTracker(input: DescribeTrackerInput, completion: @escaping (ClientRuntime.SdkResult<DescribeTrackerOutputResponse, DescribeTrackerOutputError>) -> Void)
```

### disassociateTrackerConsumer(input:completion:)

Removes the association between a tracker resource and a geofence collection. Once you unlink a tracker resource from a geofence collection, the tracker positions will no longer be automatically evaluated against geofences.

``` swift
func disassociateTrackerConsumer(input: DisassociateTrackerConsumerInput, completion: @escaping (ClientRuntime.SdkResult<DisassociateTrackerConsumerOutputResponse, DisassociateTrackerConsumerOutputError>) -> Void)
```

### getDevicePosition(input:completion:)

Retrieves a device's most recent position according to its sample time. Device positions are deleted after 30 days.

``` swift
func getDevicePosition(input: GetDevicePositionInput, completion: @escaping (ClientRuntime.SdkResult<GetDevicePositionOutputResponse, GetDevicePositionOutputError>) -> Void)
```

### getDevicePositionHistory(input:completion:)

Retrieves the device position history from a tracker resource within a specified range of time. Device positions are deleted after 30 days.

``` swift
func getDevicePositionHistory(input: GetDevicePositionHistoryInput, completion: @escaping (ClientRuntime.SdkResult<GetDevicePositionHistoryOutputResponse, GetDevicePositionHistoryOutputError>) -> Void)
```

### getGeofence(input:completion:)

Retrieves the geofence details from a geofence collection.

``` swift
func getGeofence(input: GetGeofenceInput, completion: @escaping (ClientRuntime.SdkResult<GetGeofenceOutputResponse, GetGeofenceOutputError>) -> Void)
```

### getMapGlyphs(input:completion:)

Retrieves glyphs used to display labels on a map.

``` swift
func getMapGlyphs(input: GetMapGlyphsInput, completion: @escaping (ClientRuntime.SdkResult<GetMapGlyphsOutputResponse, GetMapGlyphsOutputError>) -> Void)
```

### getMapSprites(input:completion:)

Retrieves the sprite sheet corresponding to a map resource. The sprite sheet is a PNG image paired with a JSON document describing the offsets of individual icons that will be displayed on a rendered map.

``` swift
func getMapSprites(input: GetMapSpritesInput, completion: @escaping (ClientRuntime.SdkResult<GetMapSpritesOutputResponse, GetMapSpritesOutputError>) -> Void)
```

### getMapStyleDescriptor(input:completion:)

Retrieves the map style descriptor from a map resource. The style descriptor contains speciﬁcations on how features render on a map. For example, what data to display, what order to display the data in, and the style for the data. Style descriptors follow the Mapbox Style Specification.

``` swift
func getMapStyleDescriptor(input: GetMapStyleDescriptorInput, completion: @escaping (ClientRuntime.SdkResult<GetMapStyleDescriptorOutputResponse, GetMapStyleDescriptorOutputError>) -> Void)
```

### getMapTile(input:completion:)

Retrieves a vector data tile from the map resource. Map tiles are used by clients to render a map. they're addressed using a grid arrangement with an X coordinate, Y coordinate, and Z (zoom) level. The origin (0, 0) is the top left of the map. Increasing the zoom level by 1 doubles both the X and Y dimensions, so a tile containing data for the entire world at (0/0/0) will be split into 4 tiles at zoom 1 (1/0/0, 1/0/1, 1/1/0, 1/1/1).

``` swift
func getMapTile(input: GetMapTileInput, completion: @escaping (ClientRuntime.SdkResult<GetMapTileOutputResponse, GetMapTileOutputError>) -> Void)
```

### listDevicePositions(input:completion:)

A batch request to retrieve all device positions.

``` swift
func listDevicePositions(input: ListDevicePositionsInput, completion: @escaping (ClientRuntime.SdkResult<ListDevicePositionsOutputResponse, ListDevicePositionsOutputError>) -> Void)
```

### listGeofenceCollections(input:completion:)

Lists geofence collections in your AWS account.

``` swift
func listGeofenceCollections(input: ListGeofenceCollectionsInput, completion: @escaping (ClientRuntime.SdkResult<ListGeofenceCollectionsOutputResponse, ListGeofenceCollectionsOutputError>) -> Void)
```

### listGeofences(input:completion:)

Lists geofences stored in a given geofence collection.

``` swift
func listGeofences(input: ListGeofencesInput, completion: @escaping (ClientRuntime.SdkResult<ListGeofencesOutputResponse, ListGeofencesOutputError>) -> Void)
```

### listMaps(input:completion:)

Lists map resources in your AWS account.

``` swift
func listMaps(input: ListMapsInput, completion: @escaping (ClientRuntime.SdkResult<ListMapsOutputResponse, ListMapsOutputError>) -> Void)
```

### listPlaceIndexes(input:completion:)

Lists place index resources in your AWS account.

``` swift
func listPlaceIndexes(input: ListPlaceIndexesInput, completion: @escaping (ClientRuntime.SdkResult<ListPlaceIndexesOutputResponse, ListPlaceIndexesOutputError>) -> Void)
```

### listRouteCalculators(input:completion:)

Lists route calculator resources in your AWS account.

``` swift
func listRouteCalculators(input: ListRouteCalculatorsInput, completion: @escaping (ClientRuntime.SdkResult<ListRouteCalculatorsOutputResponse, ListRouteCalculatorsOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

Returns a list of tags that are applied to the specified Amazon Location resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listTrackerConsumers(input:completion:)

Lists geofence collections currently associated to the given tracker resource.

``` swift
func listTrackerConsumers(input: ListTrackerConsumersInput, completion: @escaping (ClientRuntime.SdkResult<ListTrackerConsumersOutputResponse, ListTrackerConsumersOutputError>) -> Void)
```

### listTrackers(input:completion:)

Lists tracker resources in your AWS account.

``` swift
func listTrackers(input: ListTrackersInput, completion: @escaping (ClientRuntime.SdkResult<ListTrackersOutputResponse, ListTrackersOutputError>) -> Void)
```

### putGeofence(input:completion:)

Stores a geofence geometry in a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request.

``` swift
func putGeofence(input: PutGeofenceInput, completion: @escaping (ClientRuntime.SdkResult<PutGeofenceOutputResponse, PutGeofenceOutputError>) -> Void)
```

### searchPlaceIndexForPosition(input:completion:)

Reverse geocodes a given coordinate and returns a legible address. Allows you to search for Places or points of interest near a given position.

``` swift
func searchPlaceIndexForPosition(input: SearchPlaceIndexForPositionInput, completion: @escaping (ClientRuntime.SdkResult<SearchPlaceIndexForPositionOutputResponse, SearchPlaceIndexForPositionOutputError>) -> Void)
```

### searchPlaceIndexForText(input:completion:)

Geocodes free-form text, such as an address, name, city, or region to allow you to search for Places or points of interest. Includes the option to apply additional parameters to narrow your list of results. You can search for places near a given position using BiasPosition, or filter results within a bounding box using FilterBBox. Providing both parameters simultaneously returns an error.

``` swift
func searchPlaceIndexForText(input: SearchPlaceIndexForTextInput, completion: @escaping (ClientRuntime.SdkResult<SearchPlaceIndexForTextOutputResponse, SearchPlaceIndexForTextOutputError>) -> Void)
```

### tagResource(input:completion:)

Assigns one or more tags (key-value pairs) to the specified Amazon Location Service resource. Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values. You can use the TagResource operation with an Amazon Location Service resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the tags already associated with the resource. If you specify a tag key that's already associated with the resource, the new tag value that you specify replaces the previous value for that tag. You can associate up to 50 tags with a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Removes one or more tags from the specified Amazon Location resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateGeofenceCollection(input:completion:)

Updates the specified properties of a given geofence collection.

``` swift
func updateGeofenceCollection(input: UpdateGeofenceCollectionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGeofenceCollectionOutputResponse, UpdateGeofenceCollectionOutputError>) -> Void)
```

### updateMap(input:completion:)

Updates the specified properties of a given map resource.

``` swift
func updateMap(input: UpdateMapInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMapOutputResponse, UpdateMapOutputError>) -> Void)
```

### updatePlaceIndex(input:completion:)

Updates the specified properties of a given place index resource.

``` swift
func updatePlaceIndex(input: UpdatePlaceIndexInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePlaceIndexOutputResponse, UpdatePlaceIndexOutputError>) -> Void)
```

### updateRouteCalculator(input:completion:)

Updates the specified properties for a given route calculator resource.

``` swift
func updateRouteCalculator(input: UpdateRouteCalculatorInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRouteCalculatorOutputResponse, UpdateRouteCalculatorOutputError>) -> Void)
```

### updateTracker(input:completion:)

Updates the specified properties of a given tracker resource.

``` swift
func updateTracker(input: UpdateTrackerInput, completion: @escaping (ClientRuntime.SdkResult<UpdateTrackerOutputResponse, UpdateTrackerOutputError>) -> Void)
```
