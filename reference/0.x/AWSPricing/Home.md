# Types

  - [PricingClient](/aws-sdk-swift/reference/0.x/AWSPricing/PricingClient)
  - [PricingClient.PricingClientConfiguration](/aws-sdk-swift/reference/0.x/AWSPricing/PricingClient_PricingClientConfiguration)
  - [PricingClientTypes](/aws-sdk-swift/reference/0.x/AWSPricing/PricingClientTypes)
  - [PricingClientLogHandlerFactory](/aws-sdk-swift/reference/0.x/AWSPricing/PricingClientLogHandlerFactory)

# Protocols

  - [PricingClientProtocol](/aws-sdk-swift/reference/0.x/AWSPricing/PricingClientProtocol):
    Amazon Web Services Price List Service API (Amazon Web Services Price List Service) is a centralized and convenient way to
    programmatically query Amazon Web Services for services, products, and pricing information. The Amazon Web Services Price List Service
    uses standardized product attributes such as Location, Storage
    Class, and Operating System, and provides prices at the SKU
    level. You can use the Amazon Web Services Price List Service to build cost control and scenario planning tools, reconcile
    billing data, forecast future spend for budgeting purposes, and provide cost benefit
    analysis that compare your internal workloads with Amazon Web Services.
    Use GetServices without a service code to retrieve the service codes for all AWS services, then
    GetServices with a service code to retreive the attribute names for
    that service. After you have the service code and attribute names, you can use GetAttributeValues
    to see what values are available for an attribute. With the service code and an attribute name and value,
    you can use GetProducts to find specific products that you're interested in, such as
    an AmazonEC2 instance, with a Provisioned IOPS
    volumeType.
    Service Endpoint
    Amazon Web Services Price List Service API provides the following two endpoints:
