# MediaPackageVodClientProtocol

AWS Elemental MediaPackage VOD

``` swift
public protocol MediaPackageVodClientProtocol 
```

## Requirements

### configureLogs(input:​completion:​)

Changes the packaging group's properities to configure log subscription

``` swift
func configureLogs(input: ConfigureLogsInput, completion: @escaping (ClientRuntime.SdkResult<ConfigureLogsOutputResponse, ConfigureLogsOutputError>) -> Void)
```

### createAsset(input:​completion:​)

Creates a new MediaPackage VOD Asset resource.

``` swift
func createAsset(input: CreateAssetInput, completion: @escaping (ClientRuntime.SdkResult<CreateAssetOutputResponse, CreateAssetOutputError>) -> Void)
```

### createPackagingConfiguration(input:​completion:​)

Creates a new MediaPackage VOD PackagingConfiguration resource.

``` swift
func createPackagingConfiguration(input: CreatePackagingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<CreatePackagingConfigurationOutputResponse, CreatePackagingConfigurationOutputError>) -> Void)
```

### createPackagingGroup(input:​completion:​)

Creates a new MediaPackage VOD PackagingGroup resource.

``` swift
func createPackagingGroup(input: CreatePackagingGroupInput, completion: @escaping (ClientRuntime.SdkResult<CreatePackagingGroupOutputResponse, CreatePackagingGroupOutputError>) -> Void)
```

### deleteAsset(input:​completion:​)

Deletes an existing MediaPackage VOD Asset resource.

``` swift
func deleteAsset(input: DeleteAssetInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAssetOutputResponse, DeleteAssetOutputError>) -> Void)
```

### deletePackagingConfiguration(input:​completion:​)

Deletes a MediaPackage VOD PackagingConfiguration resource.

``` swift
func deletePackagingConfiguration(input: DeletePackagingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DeletePackagingConfigurationOutputResponse, DeletePackagingConfigurationOutputError>) -> Void)
```

### deletePackagingGroup(input:​completion:​)

Deletes a MediaPackage VOD PackagingGroup resource.

``` swift
func deletePackagingGroup(input: DeletePackagingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DeletePackagingGroupOutputResponse, DeletePackagingGroupOutputError>) -> Void)
```

### describeAsset(input:​completion:​)

Returns a description of a MediaPackage VOD Asset resource.

``` swift
func describeAsset(input: DescribeAssetInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAssetOutputResponse, DescribeAssetOutputError>) -> Void)
```

### describePackagingConfiguration(input:​completion:​)

Returns a description of a MediaPackage VOD PackagingConfiguration resource.

``` swift
func describePackagingConfiguration(input: DescribePackagingConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<DescribePackagingConfigurationOutputResponse, DescribePackagingConfigurationOutputError>) -> Void)
```

### describePackagingGroup(input:​completion:​)

Returns a description of a MediaPackage VOD PackagingGroup resource.

``` swift
func describePackagingGroup(input: DescribePackagingGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribePackagingGroupOutputResponse, DescribePackagingGroupOutputError>) -> Void)
```

### listAssets(input:​completion:​)

Returns a collection of MediaPackage VOD Asset resources.

``` swift
func listAssets(input: ListAssetsInput, completion: @escaping (ClientRuntime.SdkResult<ListAssetsOutputResponse, ListAssetsOutputError>) -> Void)
```

### listPackagingConfigurations(input:​completion:​)

Returns a collection of MediaPackage VOD PackagingConfiguration resources.

``` swift
func listPackagingConfigurations(input: ListPackagingConfigurationsInput, completion: @escaping (ClientRuntime.SdkResult<ListPackagingConfigurationsOutputResponse, ListPackagingConfigurationsOutputError>) -> Void)
```

### listPackagingGroups(input:​completion:​)

Returns a collection of MediaPackage VOD PackagingGroup resources.

``` swift
func listPackagingGroups(input: ListPackagingGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListPackagingGroupsOutputResponse, ListPackagingGroupsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns a list of the tags assigned to the specified resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds tags to the specified resource. You can specify one or more tags to add.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from the specified resource. You can specify one or more tags to remove.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updatePackagingGroup(input:​completion:​)

Updates a specific packaging group. You can't change the id attribute or any other system-generated attributes.

``` swift
func updatePackagingGroup(input: UpdatePackagingGroupInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePackagingGroupOutputResponse, UpdatePackagingGroupOutputError>) -> Void)
```
