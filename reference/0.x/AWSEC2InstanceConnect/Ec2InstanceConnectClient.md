# Ec2InstanceConnectClient

``` swift
public class Ec2InstanceConnectClient 
```

## Inheritance

[`Ec2InstanceConnectClientProtocol`](/aws-sdk-swift/reference/0.x/AWSEC2InstanceConnect/Ec2InstanceConnectClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Properties

### `clientName`

``` swift
public static let clientName = "Ec2InstanceConnectClient"
```

## Methods

### `sendSSHPublicKey(input:completion:)`

Pushes an SSH public key to the specified EC2 instance for use by the specified user. The key remains for 60 seconds. For more information, see [Connect to your Linux instance using EC2 Instance Connect](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Connect-using-EC2-Instance-Connect.html) in the Amazon EC2 User Guide.

``` swift
public func sendSSHPublicKey(input: SendSSHPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<SendSSHPublicKeyOutputResponse, SendSSHPublicKeyOutputError>) -> Void)
```

### `sendSerialConsoleSSHPublicKey(input:completion:)`

Pushes an SSH public key to the specified EC2 instance. The key remains for 60 seconds, which gives you 60 seconds to establish a serial console connection to the instance using SSH. For more information, see [EC2 Serial Console](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-serial-console.html) in the Amazon EC2 User Guide.

``` swift
public func sendSerialConsoleSSHPublicKey(input: SendSerialConsoleSSHPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<SendSerialConsoleSSHPublicKeyOutputResponse, SendSerialConsoleSSHPublicKeyOutputError>) -> Void)
```
