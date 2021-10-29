# CloudSearchClientProtocol

Amazon CloudSearch Configuration Service You use the Amazon CloudSearch configuration service to create, configure, and manage search domains. Configuration service requests are submitted using the AWS Query protocol. AWS Query requests are HTTP or HTTPS requests submitted via HTTP GET or POST with a query parameter named Action. The endpoint for configuration service requests is region-specific: cloudsearch.region.amazonaws.com. For example, cloudsearch.us-east-1.amazonaws.com. For a current list of supported regions and endpoints, see [Regions and Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html#cloudsearch_region).

``` swift
public protocol CloudSearchClientProtocol 
```

## Requirements

### buildSuggesters(input:completion:)

Indexes the search suggestions. For more information, see [Configuring Suggesters](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html#configuring-suggesters) in the Amazon CloudSearch Developer Guide.

``` swift
func buildSuggesters(input: BuildSuggestersInput, completion: @escaping (ClientRuntime.SdkResult<BuildSuggestersOutputResponse, BuildSuggestersOutputError>) -> Void)
```

### createDomain(input:completion:)

Creates a new search domain. For more information, see [Creating a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/creating-domains.html) in the Amazon CloudSearch Developer Guide.

``` swift
func createDomain(input: CreateDomainInput, completion: @escaping (ClientRuntime.SdkResult<CreateDomainOutputResponse, CreateDomainOutputError>) -> Void)
```

### defineAnalysisScheme(input:completion:)

Configures an analysis scheme that can be applied to a text or text-array field to define language-specific text processing options. For more information, see [Configuring Analysis Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html) in the Amazon CloudSearch Developer Guide.

``` swift
func defineAnalysisScheme(input: DefineAnalysisSchemeInput, completion: @escaping (ClientRuntime.SdkResult<DefineAnalysisSchemeOutputResponse, DefineAnalysisSchemeOutputError>) -> Void)
```

### defineExpression(input:completion:)

Configures an \[Expression\] for the search domain. Used to create new expressions and modify existing ones. If the expression exists, the new configuration replaces the old one. For more information, see [Configuring Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html) in the Amazon CloudSearch Developer Guide.

``` swift
func defineExpression(input: DefineExpressionInput, completion: @escaping (ClientRuntime.SdkResult<DefineExpressionOutputResponse, DefineExpressionOutputError>) -> Void)
```

### defineIndexField(input:completion:)

Configures an \[IndexField\] for the search domain. Used to create new fields and modify existing ones. You must specify the name of the domain you are configuring and an index field configuration. The index field configuration specifies a unique name, the index field type, and the options you want to configure for the field. The options you can specify depend on the \[IndexFieldType\]. If the field exists, the new configuration replaces the old one. For more information, see [Configuring Index Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html) in the Amazon CloudSearch Developer Guide.

``` swift
func defineIndexField(input: DefineIndexFieldInput, completion: @escaping (ClientRuntime.SdkResult<DefineIndexFieldOutputResponse, DefineIndexFieldOutputError>) -> Void)
```

### defineSuggester(input:completion:)

Configures a suggester for a domain. A suggester enables you to display possible matches before users finish typing their queries. When you configure a suggester, you must specify the name of the text field you want to search for possible matches and a unique name for the suggester. For more information, see [Getting Search Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html) in the Amazon CloudSearch Developer Guide.

``` swift
func defineSuggester(input: DefineSuggesterInput, completion: @escaping (ClientRuntime.SdkResult<DefineSuggesterOutputResponse, DefineSuggesterOutputError>) -> Void)
```

### deleteAnalysisScheme(input:completion:)

Deletes an analysis scheme. For more information, see [Configuring Analysis Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html) in the Amazon CloudSearch Developer Guide.

``` swift
func deleteAnalysisScheme(input: DeleteAnalysisSchemeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAnalysisSchemeOutputResponse, DeleteAnalysisSchemeOutputError>) -> Void)
```

### deleteDomain(input:completion:)

Permanently deletes a search domain and all of its data. Once a domain has been deleted, it cannot be recovered. For more information, see [Deleting a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/deleting-domains.html) in the Amazon CloudSearch Developer Guide.

``` swift
func deleteDomain(input: DeleteDomainInput, completion: @escaping (ClientRuntime.SdkResult<DeleteDomainOutputResponse, DeleteDomainOutputError>) -> Void)
```

### deleteExpression(input:completion:)

Removes an \[Expression\] from the search domain. For more information, see [Configuring Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html) in the Amazon CloudSearch Developer Guide.

``` swift
func deleteExpression(input: DeleteExpressionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteExpressionOutputResponse, DeleteExpressionOutputError>) -> Void)
```

### deleteIndexField(input:completion:)

Removes an \[IndexField\] from the search domain. For more information, see [Configuring Index Fields](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-index-fields.html) in the Amazon CloudSearch Developer Guide.

``` swift
func deleteIndexField(input: DeleteIndexFieldInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIndexFieldOutputResponse, DeleteIndexFieldOutputError>) -> Void)
```

### deleteSuggester(input:completion:)

Deletes a suggester. For more information, see [Getting Search Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html) in the Amazon CloudSearch Developer Guide.

``` swift
func deleteSuggester(input: DeleteSuggesterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSuggesterOutputResponse, DeleteSuggesterOutputError>) -> Void)
```

### describeAnalysisSchemes(input:completion:)

Gets the analysis schemes configured for a domain. An analysis scheme defines language-specific text processing options for a text field. Can be limited to specific analysis schemes by name. By default, shows all analysis schemes and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see [Configuring Analysis Schemes](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-analysis-schemes.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeAnalysisSchemes(input: DescribeAnalysisSchemesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAnalysisSchemesOutputResponse, DescribeAnalysisSchemesOutputError>) -> Void)
```

### describeAvailabilityOptions(input:completion:)

Gets the availability options configured for a domain. By default, shows the configuration with any pending changes. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see [Configuring Availability Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeAvailabilityOptions(input: DescribeAvailabilityOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAvailabilityOptionsOutputResponse, DescribeAvailabilityOptionsOutputError>) -> Void)
```

### describeDomainEndpointOptions(input:completion:)

Returns the domain's endpoint options, specifically whether all requests to the domain must arrive over HTTPS. For more information, see [Configuring Domain Endpoint Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-domain-endpoint-options.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeDomainEndpointOptions(input: DescribeDomainEndpointOptionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainEndpointOptionsOutputResponse, DescribeDomainEndpointOptionsOutputError>) -> Void)
```

### describeDomains(input:completion:)

Gets information about the search domains owned by this account. Can be limited to specific domains. Shows all domains by default. To get the number of searchable documents in a domain, use the console or submit a matchall request to your domain's search endpoint: q=matchall\&q.parser=structured\&size=0. For more information, see [Getting Information about a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeDomains(input: DescribeDomainsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDomainsOutputResponse, DescribeDomainsOutputError>) -> Void)
```

### describeExpressions(input:completion:)

Gets the expressions configured for the search domain. Can be limited to specific expressions by name. By default, shows all expressions and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see [Configuring Expressions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-expressions.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeExpressions(input: DescribeExpressionsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExpressionsOutputResponse, DescribeExpressionsOutputError>) -> Void)
```

### describeIndexFields(input:completion:)

Gets information about the index fields configured for the search domain. Can be limited to specific fields by name. By default, shows all fields and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see [Getting Domain Information](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-domain-info.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeIndexFields(input: DescribeIndexFieldsInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIndexFieldsOutputResponse, DescribeIndexFieldsOutputError>) -> Void)
```

### describeScalingParameters(input:completion:)

Gets the scaling parameters configured for a domain. A domain's scaling parameters specify the desired search instance type and replication count. For more information, see [Configuring Scaling Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeScalingParameters(input: DescribeScalingParametersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeScalingParametersOutputResponse, DescribeScalingParametersOutputError>) -> Void)
```

### describeServiceAccessPolicies(input:completion:)

Gets information about the access policies that control access to the domain's document and search endpoints. By default, shows the configuration with any pending changes. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see [Configuring Access for a Search Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeServiceAccessPolicies(input: DescribeServiceAccessPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<DescribeServiceAccessPoliciesOutputResponse, DescribeServiceAccessPoliciesOutputError>) -> Void)
```

### describeSuggesters(input:completion:)

Gets the suggesters configured for a domain. A suggester enables you to display possible matches before users finish typing their queries. Can be limited to specific suggesters by name. By default, shows all suggesters and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see [Getting Search Suggestions](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/getting-suggestions.html) in the Amazon CloudSearch Developer Guide.

``` swift
func describeSuggesters(input: DescribeSuggestersInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSuggestersOutputResponse, DescribeSuggestersOutputError>) -> Void)
```

### indexDocuments(input:completion:)

Tells the search domain to start indexing its documents using the latest indexing options. This operation must be invoked to activate options whose \[OptionStatus\] is RequiresIndexDocuments.

``` swift
func indexDocuments(input: IndexDocumentsInput, completion: @escaping (ClientRuntime.SdkResult<IndexDocumentsOutputResponse, IndexDocumentsOutputError>) -> Void)
```

### listDomainNames(input:completion:)

Lists all search domains owned by an account.

``` swift
func listDomainNames(input: ListDomainNamesInput, completion: @escaping (ClientRuntime.SdkResult<ListDomainNamesOutputResponse, ListDomainNamesOutputError>) -> Void)
```

### updateAvailabilityOptions(input:completion:)

Configures the availability options for a domain. Enabling the Multi-AZ option expands an Amazon CloudSearch domain to an additional Availability Zone in the same Region to increase fault tolerance in the event of a service disruption. Changes to the Multi-AZ option can take about half an hour to become active. For more information, see [Configuring Availability Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-availability-options.html) in the Amazon CloudSearch Developer Guide.

``` swift
func updateAvailabilityOptions(input: UpdateAvailabilityOptionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAvailabilityOptionsOutputResponse, UpdateAvailabilityOptionsOutputError>) -> Void)
```

### updateDomainEndpointOptions(input:completion:)

Updates the domain's endpoint options, specifically whether all requests to the domain must arrive over HTTPS. For more information, see [Configuring Domain Endpoint Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-domain-endpoint-options.html) in the Amazon CloudSearch Developer Guide.

``` swift
func updateDomainEndpointOptions(input: UpdateDomainEndpointOptionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateDomainEndpointOptionsOutputResponse, UpdateDomainEndpointOptionsOutputError>) -> Void)
```

### updateScalingParameters(input:completion:)

Configures scaling parameters for a domain. A domain's scaling parameters specify the desired search instance type and replication count. Amazon CloudSearch will still automatically scale your domain based on the volume of data and traffic, but not below the desired instance type and replication count. If the Multi-AZ option is enabled, these values control the resources used per Availability Zone. For more information, see [Configuring Scaling Options](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-scaling-options.html) in the Amazon CloudSearch Developer Guide.

``` swift
func updateScalingParameters(input: UpdateScalingParametersInput, completion: @escaping (ClientRuntime.SdkResult<UpdateScalingParametersOutputResponse, UpdateScalingParametersOutputError>) -> Void)
```

### updateServiceAccessPolicies(input:completion:)

Configures the access rules that control access to the domain's document and search endpoints. For more information, see [ Configuring Access for an Amazon CloudSearch Domain](http://docs.aws.amazon.com/cloudsearch/latest/developerguide/configuring-access.html).

``` swift
func updateServiceAccessPolicies(input: UpdateServiceAccessPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<UpdateServiceAccessPoliciesOutputResponse, UpdateServiceAccessPoliciesOutputError>) -> Void)
```
