# Types

  - [DetectiveClient](/aws-sdk-swift/reference/0.x/AWSDetective/DetectiveClient)
  - [DetectiveClient.DetectiveClientConfiguration](/aws-sdk-swift/reference/0.x/AWSDetective/DetectiveClient_DetectiveClientConfiguration)
  - [DetectiveClientTypes](/aws-sdk-swift/reference/0.x/AWSDetective/DetectiveClientTypes)
  - [DetectiveClientLogHandlerFactory](/aws-sdk-swift/reference/0.x/AWSDetective/DetectiveClientLogHandlerFactory)

# Protocols

  - [DetectiveClientProtocol](/aws-sdk-swift/reference/0.x/AWSDetective/DetectiveClientProtocol):
    Detective uses machine learning and purpose-built visualizations to help you analyze and
    investigate security issues across your Amazon Web Services (AWS) workloads. Detective automatically
    extracts time-based events such as login attempts, API calls, and network traffic from
    AWS CloudTrail and Amazon Virtual Private Cloud (Amazon VPC) flow logs. It also extracts findings detected by
    Amazon GuardDuty.
    The Detective API primarily supports the creation and management of behavior graphs. A
    behavior graph contains the extracted data from a set of member accounts, and is created
    and managed by an administrator account.
    Every behavior graph is specific to a Region. You can only use the API to manage graphs
    that belong to the Region that is associated with the currently selected endpoint.
    A Detective administrator account can use the Detective API to do the following:
