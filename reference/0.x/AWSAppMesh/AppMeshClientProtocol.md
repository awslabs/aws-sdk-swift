# AppMeshClientProtocol

App Mesh is a service mesh based on the Envoy proxy that makes it easy to monitor and control microservices. App Mesh standardizes how your microservices communicate, giving you end-to-end visibility and helping to ensure high availability for your applications. App Mesh gives you consistent visibility and network traffic controls for every microservice in an application. You can use App Mesh with Amazon Web Services Fargate, Amazon ECS, Amazon EKS, Kubernetes on Amazon Web Services, and Amazon EC2. App Mesh supports microservice applications that use service discovery naming for their components. For more information about service discovery on Amazon ECS, see [Service Discovery](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html) in the Amazon Elastic Container Service Developer Guide. Kubernetes kube-dns and coredns are supported. For more information, see [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/) in the Kubernetes documentation.

``` swift
public protocol AppMeshClientProtocol 
```

## Requirements

### createGatewayRoute(input:completion:)

Creates a gateway route. A gateway route is attached to a virtual gateway and routes traffic to an existing virtual service. If a route matches a request, it can distribute traffic to a target virtual service. For more information about gateway routes, see [Gateway routes](https://docs.aws.amazon.com/app-mesh/latest/userguide/gateway-routes.html).

``` swift
func createGatewayRoute(input: CreateGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateGatewayRouteOutputResponse, CreateGatewayRouteOutputError>) -> Void)
```

### createMesh(input:completion:)

Creates a service mesh. A service mesh is a logical boundary for network traffic between services that are represented by resources within the mesh. After you create your service mesh, you can create virtual services, virtual nodes, virtual routers, and routes to distribute traffic between the applications in your mesh. For more information about service meshes, see [Service meshes](https://docs.aws.amazon.com/app-mesh/latest/userguide/meshes.html).

``` swift
func createMesh(input: CreateMeshInput, completion: @escaping (ClientRuntime.SdkResult<CreateMeshOutputResponse, CreateMeshOutputError>) -> Void)
```

### createRoute(input:completion:)

Creates a route that is associated with a virtual router. You can route several different protocols and define a retry policy for a route. Traffic can be routed to one or more virtual nodes. For more information about routes, see [Routes](https://docs.aws.amazon.com/app-mesh/latest/userguide/routes.html).

``` swift
func createRoute(input: CreateRouteInput, completion: @escaping (ClientRuntime.SdkResult<CreateRouteOutputResponse, CreateRouteOutputError>) -> Void)
```

### createVirtualGateway(input:completion:)

Creates a virtual gateway. A virtual gateway allows resources outside your mesh to communicate to resources that are inside your mesh. The virtual gateway represents an Envoy proxy running in an Amazon ECS task, in a Kubernetes service, or on an Amazon EC2 instance. Unlike a virtual node, which represents an Envoy running with an application, a virtual gateway represents Envoy deployed by itself. For more information about virtual gateways, see [Virtual gateways](https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_gateways.html).

``` swift
func createVirtualGateway(input: CreateVirtualGatewayInput, completion: @escaping (ClientRuntime.SdkResult<CreateVirtualGatewayOutputResponse, CreateVirtualGatewayOutputError>) -> Void)
```

### createVirtualNode(input:completion:)

Creates a virtual node within a service mesh. A virtual node acts as a logical pointer to a particular task group, such as an Amazon ECS service or a Kubernetes deployment. When you create a virtual node, you can specify the service discovery information for your task group, and whether the proxy running in a task group will communicate with other proxies using Transport Layer Security (TLS). You define a listener for any inbound traffic that your virtual node expects. Any virtual service that your virtual node expects to communicate to is specified as a backend. The response metadata for your new virtual node contains the arn that is associated with the virtual node. Set this value to the full ARN; for example, arn:aws:appmesh:us-west-2:123456789012:myMesh/default/virtualNode/myApp) as the APPMESH\_RESOURCE\_ARN environment variable for your task group's Envoy proxy container in your task definition or pod spec. This is then mapped to the node.id and node.cluster Envoy parameters. By default, App Mesh uses the name of the resource you specified in APPMESH\_RESOURCE\_ARN when Envoy is referring to itself in metrics and traces. You can override this behavior by setting the APPMESH\_RESOURCE\_CLUSTER environment variable with your own name. For more information about virtual nodes, see [Virtual nodes](https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_nodes.html). You must be using 1.15.0 or later of the Envoy image when setting these variables. For more information aboutApp Mesh Envoy variables, see [Envoy image](https://docs.aws.amazon.com/app-mesh/latest/userguide/envoy.html) in the AWS App Mesh User Guide.

``` swift
func createVirtualNode(input: CreateVirtualNodeInput, completion: @escaping (ClientRuntime.SdkResult<CreateVirtualNodeOutputResponse, CreateVirtualNodeOutputError>) -> Void)
```

### createVirtualRouter(input:completion:)

Creates a virtual router within a service mesh. Specify a listener for any inbound traffic that your virtual router receives. Create a virtual router for each protocol and port that you need to route. Virtual routers handle traffic for one or more virtual services within your mesh. After you create your virtual router, create and associate routes for your virtual router that direct incoming requests to different virtual nodes. For more information about virtual routers, see [Virtual routers](https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_routers.html).

``` swift
func createVirtualRouter(input: CreateVirtualRouterInput, completion: @escaping (ClientRuntime.SdkResult<CreateVirtualRouterOutputResponse, CreateVirtualRouterOutputError>) -> Void)
```

### createVirtualService(input:completion:)

Creates a virtual service within a service mesh. A virtual service is an abstraction of a real service that is provided by a virtual node directly or indirectly by means of a virtual router. Dependent services call your virtual service by its virtualServiceName, and those requests are routed to the virtual node or virtual router that is specified as the provider for the virtual service. For more information about virtual services, see [Virtual services](https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_services.html).

``` swift
func createVirtualService(input: CreateVirtualServiceInput, completion: @escaping (ClientRuntime.SdkResult<CreateVirtualServiceOutputResponse, CreateVirtualServiceOutputError>) -> Void)
```

### deleteGatewayRoute(input:completion:)

Deletes an existing gateway route.

``` swift
func deleteGatewayRoute(input: DeleteGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteGatewayRouteOutputResponse, DeleteGatewayRouteOutputError>) -> Void)
```

### deleteMesh(input:completion:)

Deletes an existing service mesh. You must delete all resources (virtual services, routes, virtual routers, and virtual nodes) in the service mesh before you can delete the mesh itself.

``` swift
func deleteMesh(input: DeleteMeshInput, completion: @escaping (ClientRuntime.SdkResult<DeleteMeshOutputResponse, DeleteMeshOutputError>) -> Void)
```

### deleteRoute(input:completion:)

Deletes an existing route.

``` swift
func deleteRoute(input: DeleteRouteInput, completion: @escaping (ClientRuntime.SdkResult<DeleteRouteOutputResponse, DeleteRouteOutputError>) -> Void)
```

### deleteVirtualGateway(input:completion:)

Deletes an existing virtual gateway. You cannot delete a virtual gateway if any gateway routes are associated to it.

``` swift
func deleteVirtualGateway(input: DeleteVirtualGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualGatewayOutputResponse, DeleteVirtualGatewayOutputError>) -> Void)
```

### deleteVirtualNode(input:completion:)

Deletes an existing virtual node. You must delete any virtual services that list a virtual node as a service provider before you can delete the virtual node itself.

``` swift
func deleteVirtualNode(input: DeleteVirtualNodeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualNodeOutputResponse, DeleteVirtualNodeOutputError>) -> Void)
```

### deleteVirtualRouter(input:completion:)

Deletes an existing virtual router. You must delete any routes associated with the virtual router before you can delete the router itself.

``` swift
func deleteVirtualRouter(input: DeleteVirtualRouterInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualRouterOutputResponse, DeleteVirtualRouterOutputError>) -> Void)
```

### deleteVirtualService(input:completion:)

Deletes an existing virtual service.

``` swift
func deleteVirtualService(input: DeleteVirtualServiceInput, completion: @escaping (ClientRuntime.SdkResult<DeleteVirtualServiceOutputResponse, DeleteVirtualServiceOutputError>) -> Void)
```

### describeGatewayRoute(input:completion:)

Describes an existing gateway route.

``` swift
func describeGatewayRoute(input: DescribeGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<DescribeGatewayRouteOutputResponse, DescribeGatewayRouteOutputError>) -> Void)
```

### describeMesh(input:completion:)

Describes an existing service mesh.

``` swift
func describeMesh(input: DescribeMeshInput, completion: @escaping (ClientRuntime.SdkResult<DescribeMeshOutputResponse, DescribeMeshOutputError>) -> Void)
```

### describeRoute(input:completion:)

Describes an existing route.

``` swift
func describeRoute(input: DescribeRouteInput, completion: @escaping (ClientRuntime.SdkResult<DescribeRouteOutputResponse, DescribeRouteOutputError>) -> Void)
```

### describeVirtualGateway(input:completion:)

Describes an existing virtual gateway.

``` swift
func describeVirtualGateway(input: DescribeVirtualGatewayInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualGatewayOutputResponse, DescribeVirtualGatewayOutputError>) -> Void)
```

### describeVirtualNode(input:completion:)

Describes an existing virtual node.

``` swift
func describeVirtualNode(input: DescribeVirtualNodeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualNodeOutputResponse, DescribeVirtualNodeOutputError>) -> Void)
```

### describeVirtualRouter(input:completion:)

Describes an existing virtual router.

``` swift
func describeVirtualRouter(input: DescribeVirtualRouterInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualRouterOutputResponse, DescribeVirtualRouterOutputError>) -> Void)
```

### describeVirtualService(input:completion:)

Describes an existing virtual service.

``` swift
func describeVirtualService(input: DescribeVirtualServiceInput, completion: @escaping (ClientRuntime.SdkResult<DescribeVirtualServiceOutputResponse, DescribeVirtualServiceOutputError>) -> Void)
```

### listGatewayRoutes(input:completion:)

Returns a list of existing gateway routes that are associated to a virtual gateway.

``` swift
func listGatewayRoutes(input: ListGatewayRoutesInput, completion: @escaping (ClientRuntime.SdkResult<ListGatewayRoutesOutputResponse, ListGatewayRoutesOutputError>) -> Void)
```

### listMeshes(input:completion:)

Returns a list of existing service meshes.

``` swift
func listMeshes(input: ListMeshesInput, completion: @escaping (ClientRuntime.SdkResult<ListMeshesOutputResponse, ListMeshesOutputError>) -> Void)
```

### listRoutes(input:completion:)

Returns a list of existing routes in a service mesh.

``` swift
func listRoutes(input: ListRoutesInput, completion: @escaping (ClientRuntime.SdkResult<ListRoutesOutputResponse, ListRoutesOutputError>) -> Void)
```

### listTagsForResource(input:completion:)

List the tags for an App Mesh resource.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### listVirtualGateways(input:completion:)

Returns a list of existing virtual gateways in a service mesh.

``` swift
func listVirtualGateways(input: ListVirtualGatewaysInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualGatewaysOutputResponse, ListVirtualGatewaysOutputError>) -> Void)
```

### listVirtualNodes(input:completion:)

Returns a list of existing virtual nodes.

``` swift
func listVirtualNodes(input: ListVirtualNodesInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualNodesOutputResponse, ListVirtualNodesOutputError>) -> Void)
```

### listVirtualRouters(input:completion:)

Returns a list of existing virtual routers in a service mesh.

``` swift
func listVirtualRouters(input: ListVirtualRoutersInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualRoutersOutputResponse, ListVirtualRoutersOutputError>) -> Void)
```

### listVirtualServices(input:completion:)

Returns a list of existing virtual services in a service mesh.

``` swift
func listVirtualServices(input: ListVirtualServicesInput, completion: @escaping (ClientRuntime.SdkResult<ListVirtualServicesOutputResponse, ListVirtualServicesOutputError>) -> Void)
```

### tagResource(input:completion:)

Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource aren't specified in the request parameters, they aren't changed. When a resource is deleted, the tags associated with that resource are also deleted.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:completion:)

Deletes specified tags from a resource.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateGatewayRoute(input:completion:)

Updates an existing gateway route that is associated to a specified virtual gateway in a service mesh.

``` swift
func updateGatewayRoute(input: UpdateGatewayRouteInput, completion: @escaping (ClientRuntime.SdkResult<UpdateGatewayRouteOutputResponse, UpdateGatewayRouteOutputError>) -> Void)
```

### updateMesh(input:completion:)

Updates an existing service mesh.

``` swift
func updateMesh(input: UpdateMeshInput, completion: @escaping (ClientRuntime.SdkResult<UpdateMeshOutputResponse, UpdateMeshOutputError>) -> Void)
```

### updateRoute(input:completion:)

Updates an existing route for a specified service mesh and virtual router.

``` swift
func updateRoute(input: UpdateRouteInput, completion: @escaping (ClientRuntime.SdkResult<UpdateRouteOutputResponse, UpdateRouteOutputError>) -> Void)
```

### updateVirtualGateway(input:completion:)

Updates an existing virtual gateway in a specified service mesh.

``` swift
func updateVirtualGateway(input: UpdateVirtualGatewayInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVirtualGatewayOutputResponse, UpdateVirtualGatewayOutputError>) -> Void)
```

### updateVirtualNode(input:completion:)

Updates an existing virtual node in a specified service mesh.

``` swift
func updateVirtualNode(input: UpdateVirtualNodeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVirtualNodeOutputResponse, UpdateVirtualNodeOutputError>) -> Void)
```

### updateVirtualRouter(input:completion:)

Updates an existing virtual router in a specified service mesh.

``` swift
func updateVirtualRouter(input: UpdateVirtualRouterInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVirtualRouterOutputResponse, UpdateVirtualRouterOutputError>) -> Void)
```

### updateVirtualService(input:completion:)

Updates an existing virtual service in a specified service mesh.

``` swift
func updateVirtualService(input: UpdateVirtualServiceInput, completion: @escaping (ClientRuntime.SdkResult<UpdateVirtualServiceOutputResponse, UpdateVirtualServiceOutputError>) -> Void)
```
