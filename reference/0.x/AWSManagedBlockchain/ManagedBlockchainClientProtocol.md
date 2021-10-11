# ManagedBlockchainClientProtocol

Amazon Managed Blockchain is a fully managed service for creating and managing blockchain networks using open-source frameworks. Blockchain allows you to build applications where multiple parties can securely and transparently run transactions and share data without the need for a trusted, central authority.
Managed Blockchain supports the Hyperledger Fabric and Ethereum open-source frameworks. Because of fundamental differences between the frameworks, some API actions or data types may only apply in the context of one framework and not the other. For example, actions related to Hyperledger Fabric network members such as CreateMember and DeleteMember do not apply to Ethereum.
The description for each action indicates the framework or frameworks to which it applies. Data types and properties that apply only in the context of a particular framework are similarly indicated.

``` swift
public protocol ManagedBlockchainClientProtocol 
```

## Requirements

### createMember(input:​completion:​)

Creates a member within a Managed Blockchain network.
Applies only to Hyperledger Fabric.

``` swift
func createMember(input: CreateMemberInput, completion: @escaping (ClientRuntime.SdkResult<CreateMemberOutputResponse, CreateMemberOutputError>) -> Void)
```

### createNetwork(input:​completion:​)

Creates a new blockchain network using Amazon Managed Blockchain.
Applies only to Hyperledger Fabric.

``` swift
func createNetwork(input: CreateNetworkInput, completion: @escaping (ClientRuntime.SdkResult<CreateNetworkOutputResponse, CreateNetworkOutputError>) -> Void)
```

### createNode(input:​completion:​)

Creates a node on the specified blockchain network.
Applies to Hyperledger Fabric and Ethereum.

``` swift
func createNode(input: CreateNodeInput, completion: @escaping (ClientRuntime.SdkResult<CreateNodeOutputResponse, CreateNodeOutputError>) -> Void)
```

### createProposal(input:​completion:​)

Creates a proposal for a change to the network that other members of the network can vote on, for example, a proposal to add a new member to the network. Any member can create a proposal.
Applies only to Hyperledger Fabric.

``` swift
func createProposal(input: CreateProposalInput, completion: @escaping (ClientRuntime.SdkResult<CreateProposalOutputResponse, CreateProposalOutputError>) -> Void)
```

### deleteMember(input:​completion:​)

Deletes a member. Deleting a member removes the member and all associated resources from the network. DeleteMember can only be called for a specified MemberId if the principal performing the action is associated with the AWS account that owns the member. In all other cases, the DeleteMember action is carried out as the result of an approved proposal to remove a member. If MemberId is the last member in a network specified by the last AWS account, the network is deleted also.
Applies only to Hyperledger Fabric.

``` swift
func deleteMember(input: DeleteMemberInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMemberOutputResponse, DeleteMemberOutputError>) -> Void)
```

### deleteNode(input:​completion:​)

Deletes a node that your AWS account owns. All data on the node is lost and cannot be recovered.
Applies to Hyperledger Fabric and Ethereum.

``` swift
func deleteNode(input: DeleteNodeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteNodeOutputResponse, DeleteNodeOutputError>) -> Void)
```

### getMember(input:​completion:​)

Returns detailed information about a member.
Applies only to Hyperledger Fabric.

``` swift
func getMember(input: GetMemberInput, completion: @escaping (ClientRuntime.SdkResult<GetMemberOutputResponse, GetMemberOutputError>) -> Void)
```

### getNetwork(input:​completion:​)

Returns detailed information about a network.
Applies to Hyperledger Fabric and Ethereum.

``` swift
func getNetwork(input: GetNetworkInput, completion: @escaping (ClientRuntime.SdkResult<GetNetworkOutputResponse, GetNetworkOutputError>) -> Void)
```

### getNode(input:​completion:​)

Returns detailed information about a node.
Applies to Hyperledger Fabric and Ethereum.

``` swift
func getNode(input: GetNodeInput, completion: @escaping (ClientRuntime.SdkResult<GetNodeOutputResponse, GetNodeOutputError>) -> Void)
```

### getProposal(input:​completion:​)

Returns detailed information about a proposal.
Applies only to Hyperledger Fabric.

``` swift
func getProposal(input: GetProposalInput, completion: @escaping (ClientRuntime.SdkResult<GetProposalOutputResponse, GetProposalOutputError>) -> Void)
```

### listInvitations(input:​completion:​)

Returns a list of all invitations for the current AWS account.
Applies only to Hyperledger Fabric.

``` swift
func listInvitations(input: ListInvitationsInput, completion: @escaping (ClientRuntime.SdkResult<ListInvitationsOutputResponse, ListInvitationsOutputError>) -> Void)
```

### listMembers(input:​completion:​)

Returns a list of the members in a network and properties of their configurations.
Applies only to Hyperledger Fabric.

``` swift
func listMembers(input: ListMembersInput, completion: @escaping (ClientRuntime.SdkResult<ListMembersOutputResponse, ListMembersOutputError>) -> Void)
```

### listNetworks(input:​completion:​)

Returns information about the networks in which the current AWS account participates.
Applies to Hyperledger Fabric and Ethereum.

``` swift
func listNetworks(input: ListNetworksInput, completion: @escaping (ClientRuntime.SdkResult<ListNetworksOutputResponse, ListNetworksOutputError>) -> Void)
```

### listNodes(input:​completion:​)

Returns information about the nodes within a network.
Applies to Hyperledger Fabric and Ethereum.

``` swift
func listNodes(input: ListNodesInput, completion: @escaping (ClientRuntime.SdkResult<ListNodesOutputResponse, ListNodesOutputError>) -> Void)
```

### listProposals(input:​completion:​)

Returns a list of proposals for the network.
Applies only to Hyperledger Fabric.

``` swift
func listProposals(input: ListProposalsInput, completion: @escaping (ClientRuntime.SdkResult<ListProposalsOutputResponse, ListProposalsOutputError>) -> Void)
```

### listProposalVotes(input:​completion:​)

Returns the list of votes for a specified proposal, including the value of each vote and the unique identifier of the member that cast the vote.
Applies only to Hyperledger Fabric.

``` swift
func listProposalVotes(input: ListProposalVotesInput, completion: @escaping (ClientRuntime.SdkResult<ListProposalVotesOutputResponse, ListProposalVotesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Returns a list of tags for the specified resource. Each tag consists of a key and optional value.
For more information about tags, see <a href="https:​//docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide, or <a href="https:​//docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### rejectInvitation(input:​completion:​)

Rejects an invitation to join a network. This action can be called by a principal in an AWS account that has received an invitation to create a member and join a network.
Applies only to Hyperledger Fabric.

``` swift
func rejectInvitation(input: RejectInvitationInput, completion: @escaping (ClientRuntime.SdkResult<RejectInvitationOutputResponse, RejectInvitationOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds or overwrites the specified tags for the specified Amazon Managed Blockchain resource. Each tag consists of a key and optional value.
When you specify a tag key that already exists, the tag value is overwritten with the new value. Use UntagResource to remove tag keys.
A resource can have up to 50 tags. If you try to create more than 50 tags for a resource, your request fails and returns an error.
For more information about tags, see <a href="https:​//docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide, or <a href="https:​//docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes the specified tags from the Amazon Managed Blockchain resource.
For more information about tags, see <a href="https:​//docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging Resources in the Amazon Managed Blockchain Ethereum Developer Guide, or <a href="https:​//docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging Resources in the Amazon Managed Blockchain Hyperledger Fabric Developer Guide.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateMember(input:​completion:​)

Updates a member configuration with new parameters.
Applies only to Hyperledger Fabric.

``` swift
func updateMember(input: UpdateMemberInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMemberOutputResponse, UpdateMemberOutputError>) -> Void)
```

### updateNode(input:​completion:​)

Updates a node configuration with new parameters.
Applies only to Hyperledger Fabric.

``` swift
func updateNode(input: UpdateNodeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateNodeOutputResponse, UpdateNodeOutputError>) -> Void)
```

### voteOnProposal(input:​completion:​)

Casts a vote for a specified ProposalId on behalf of a member. The member to vote as, specified by VoterMemberId, must be in the same AWS account as the principal that calls the action.
Applies only to Hyperledger Fabric.

``` swift
func voteOnProposal(input: VoteOnProposalInput, completion: @escaping (ClientRuntime.SdkResult<VoteOnProposalOutputResponse, VoteOnProposalOutputError>) -> Void)
```
