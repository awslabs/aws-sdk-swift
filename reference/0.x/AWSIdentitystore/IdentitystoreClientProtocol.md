# IdentitystoreClientProtocol

The AWS Single Sign-On (SSO) Identity Store service provides a single place to retrieve all of your
identities (users and groups). For more information about AWS, see the <a href="https:​//docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">AWS Single Sign-On User
Guide.

``` swift
public protocol IdentitystoreClientProtocol 
```

## Requirements

### describeGroup(input:​completion:​)

Retrieves the group metadata and attributes from GroupId in an identity store.

``` swift
func describeGroup(input: DescribeGroupInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGroupOutputResponse, DescribeGroupOutputError>) -> Void)
```

### describeUser(input:​completion:​)

Retrieves the user metadata and attributes from UserId in an identity store.

``` swift
func describeUser(input: DescribeUserInput, completion: @escaping (ClientRuntime.SdkResult<DescribeUserOutputResponse, DescribeUserOutputError>) -> Void)
```

### listGroups(input:​completion:​)

Lists the attribute name and value of the group that you specified in the search. We only support DisplayName as a valid filter
attribute path currently, and filter is required. This API returns minimum attributes, including GroupId and group
DisplayName in the response.

``` swift
func listGroups(input: ListGroupsInput, completion: @escaping (ClientRuntime.SdkResult<ListGroupsOutputResponse, ListGroupsOutputError>) -> Void)
```

### listUsers(input:​completion:​)

Lists the attribute name and value of the user that you specified in the search. We only support UserName as a valid filter attribute
path currently, and filter is required. This API returns minimum attributes, including UserId and UserName in the
response.

``` swift
func listUsers(input: ListUsersInput, completion: @escaping (ClientRuntime.SdkResult<ListUsersOutputResponse, ListUsersOutputError>) -> Void)
```
