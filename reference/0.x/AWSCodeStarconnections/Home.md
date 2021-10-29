# Types

  - [CodeStarConnectionsClient](/aws-sdk-swift/reference/0.x/AWSCodeStarconnections/CodeStarConnectionsClient)
  - [CodeStarConnectionsClient.CodeStarConnectionsClientConfiguration](/aws-sdk-swift/reference/0.x/AWSCodeStarconnections/CodeStarConnectionsClient_CodeStarConnectionsClientConfiguration)
  - [CodeStarConnectionsClientTypes](/aws-sdk-swift/reference/0.x/AWSCodeStarconnections/CodeStarConnectionsClientTypes)
  - [CodeStarConnectionsClientLogHandlerFactory](/aws-sdk-swift/reference/0.x/AWSCodeStarconnections/CodeStarConnectionsClientLogHandlerFactory)

# Protocols

  - [CodeStarConnectionsClientProtocol](/aws-sdk-swift/reference/0.x/AWSCodeStarconnections/CodeStarConnectionsClientProtocol):
    AWS CodeStar Connections This AWS CodeStar Connections API Reference provides descriptions and usage examples of the operations and data types for the AWS CodeStar Connections API. You can use the connections API to work with connections and installations. Connections are configurations that you use to connect AWS resources to external code repositories. Each connection is a resource that can be given to services such as CodePipeline to connect to a third-party repository such as Bitbucket. For example, you can add the connection in CodePipeline so that it triggers your pipeline when a code change is made to your third-party code repository. Each connection is named and associated with a unique ARN that is used to reference the connection. When you create a connection, the console initiates a third-party connection handshake. Installations are the apps that are used to conduct this handshake. For example, the installation for the Bitbucket provider type is the Bitbucket app. When you create a connection, you can choose an existing installation or create one. When you want to create a connection to an installed provider type such as GitHub Enterprise Server, you create a host for your connections. You can work with connections by calling:
