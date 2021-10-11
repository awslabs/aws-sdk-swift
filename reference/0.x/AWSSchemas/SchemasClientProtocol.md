# SchemasClientProtocol

Amazon EventBridge Schema Registry

``` swift
public protocol SchemasClientProtocol 
```

## Requirements

### createDiscoverer(input:​completion:​)

Creates a discoverer.

``` swift
func createDiscoverer(input: CreateDiscovererInput, completion: @escaping (ClientRuntime.SdkResult<CreateDiscovererOutputResponse, CreateDiscovererOutputError>) -> Void)
```

### createRegistry(input:​completion:​)

Creates a registry.

``` swift
func createRegistry(input: CreateRegistryInput, completion: @escaping (ClientRuntime.SdkResult<CreateRegistryOutputResponse, CreateRegistryOutputError>) -> Void)
```

### createSchema(input:​completion:​)

Creates a schema definition. Inactive schemas will be deleted after two years.

``` swift
func createSchema(input: CreateSchemaInput, completion: @escaping (ClientRuntime.SdkResult<CreateSchemaOutputResponse, CreateSchemaOutputError>) -> Void)
```

### deleteDiscoverer(input:​completion:​)

Deletes a discoverer.

``` swift
func deleteDiscoverer(input: DeleteDiscovererInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDiscovererOutputResponse, DeleteDiscovererOutputError>) -> Void)
```

### deleteRegistry(input:​completion:​)

Deletes a Registry.

``` swift
func deleteRegistry(input: DeleteRegistryInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRegistryOutputResponse, DeleteRegistryOutputError>) -> Void)
```

### deleteResourcePolicy(input:​completion:​)

Delete the resource-based policy attached to the specified registry.

``` swift
func deleteResourcePolicy(input: DeleteResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyOutputResponse, DeleteResourcePolicyOutputError>) -> Void)
```

### deleteSchema(input:​completion:​)

Delete a schema definition.

``` swift
func deleteSchema(input: DeleteSchemaInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSchemaOutputResponse, DeleteSchemaOutputError>) -> Void)
```

### deleteSchemaVersion(input:​completion:​)

Delete the schema version definition

``` swift
func deleteSchemaVersion(input: DeleteSchemaVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSchemaVersionOutputResponse, DeleteSchemaVersionOutputError>) -> Void)
```

### describeCodeBinding(input:​completion:​)

Describe the code binding URI.

``` swift
func describeCodeBinding(input: DescribeCodeBindingInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCodeBindingOutputResponse, DescribeCodeBindingOutputError>) -> Void)
```

### describeDiscoverer(input:​completion:​)

Describes the discoverer.

``` swift
func describeDiscoverer(input: DescribeDiscovererInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDiscovererOutputResponse, DescribeDiscovererOutputError>) -> Void)
```

### describeRegistry(input:​completion:​)

Describes the registry.

``` swift
func describeRegistry(input: DescribeRegistryInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRegistryOutputResponse, DescribeRegistryOutputError>) -> Void)
```

### describeSchema(input:​completion:​)

Retrieve the schema definition.

``` swift
func describeSchema(input: DescribeSchemaInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSchemaOutputResponse, DescribeSchemaOutputError>) -> Void)
```

### exportSchema(input:​completion:​)

``` swift
func exportSchema(input: ExportSchemaInput, completion: @escaping (ClientRuntime.SdkResult<ExportSchemaOutputResponse, ExportSchemaOutputError>) -> Void)
```

### getCodeBindingSource(input:​completion:​)

Get the code binding source URI.

``` swift
func getCodeBindingSource(input: GetCodeBindingSourceInput, completion: @escaping (ClientRuntime.SdkResult<GetCodeBindingSourceOutputResponse, GetCodeBindingSourceOutputError>) -> Void)
```

### getDiscoveredSchema(input:​completion:​)

Get the discovered schema that was generated based on sampled events.

``` swift
func getDiscoveredSchema(input: GetDiscoveredSchemaInput, completion: @escaping (ClientRuntime.SdkResult<GetDiscoveredSchemaOutputResponse, GetDiscoveredSchemaOutputError>) -> Void)
```

### getResourcePolicy(input:​completion:​)

Retrieves the resource-based policy attached to a given registry.

``` swift
func getResourcePolicy(input: GetResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetResourcePolicyOutputResponse, GetResourcePolicyOutputError>) -> Void)
```

### listDiscoverers(input:​completion:​)

List the discoverers.

``` swift
func listDiscoverers(input: ListDiscoverersInput, completion: @escaping (ClientRuntime.SdkResult<ListDiscoverersOutputResponse, ListDiscoverersOutputError>) -> Void)
```

### listRegistries(input:​completion:​)

List the registries.

``` swift
func listRegistries(input: ListRegistriesInput, completion: @escaping (ClientRuntime.SdkResult<ListRegistriesOutputResponse, ListRegistriesOutputError>) -> Void)
```

### listSchemas(input:​completion:​)

List the schemas.

``` swift
func listSchemas(input: ListSchemasInput, completion: @escaping (ClientRuntime.SdkResult<ListSchemasOutputResponse, ListSchemasOutputError>) -> Void)
```

### listSchemaVersions(input:​completion:​)

Provides a list of the schema versions and related information.

``` swift
func listSchemaVersions(input: ListSchemaVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListSchemaVersionsOutputResponse, ListSchemaVersionsOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Get tags for resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putCodeBinding(input:​completion:​)

Put code binding URI

``` swift
func putCodeBinding(input: PutCodeBindingInput, completion: @escaping (ClientRuntime.SdkResult<PutCodeBindingOutputResponse, PutCodeBindingOutputError>) -> Void)
```

### putResourcePolicy(input:​completion:​)

The name of the policy.

``` swift
func putResourcePolicy(input: PutResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutResourcePolicyOutputResponse, PutResourcePolicyOutputError>) -> Void)
```

### searchSchemas(input:​completion:​)

Search the schemas

``` swift
func searchSchemas(input: SearchSchemasInput, completion: @escaping (ClientRuntime.SdkResult<SearchSchemasOutputResponse, SearchSchemasOutputError>) -> Void)
```

### startDiscoverer(input:​completion:​)

Starts the discoverer

``` swift
func startDiscoverer(input: StartDiscovererInput, completion: @escaping (ClientRuntime.SdkResult<StartDiscovererOutputResponse, StartDiscovererOutputError>) -> Void)
```

### stopDiscoverer(input:​completion:​)

Stops the discoverer

``` swift
func stopDiscoverer(input: StopDiscovererInput, completion: @escaping (ClientRuntime.SdkResult<StopDiscovererOutputResponse, StopDiscovererOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Add tags to a resource.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateDiscoverer(input:​completion:​)

Updates the discoverer

``` swift
func updateDiscoverer(input: UpdateDiscovererInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDiscovererOutputResponse, UpdateDiscovererOutputError>) -> Void)
```

### updateRegistry(input:​completion:​)

Updates a registry.

``` swift
func updateRegistry(input: UpdateRegistryInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRegistryOutputResponse, UpdateRegistryOutputError>) -> Void)
```

### updateSchema(input:​completion:​)

Updates the schema definition Inactive schemas will be deleted after two years.

``` swift
func updateSchema(input: UpdateSchemaInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSchemaOutputResponse, UpdateSchemaOutputError>) -> Void)
```
