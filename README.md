# AWS SDK for Swift

The **AWS SDK for Swift** is a pure Swift SDK for AWS services.

**WARNING: All interfaces are subject to change.**

## License

This library is licensed under the Apache 2.0 License. 

[![License][apache-badge]][apache-url]

[apache-badge]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[apache-url]: LICENSE


## Development

You can define a `local.properties` config file at the root of the project to modify build behavior. 

An example config with the various properties is below:

```
# comma separated list of paths to `includeBuild()`
# This is useful for local development of smithy-swift in particular 
compositeProjects=../smithy-swift

# comma separated list of services to exclude from generation from sdk-codegen. When not specified all services are generated
# specify service.VERSION matching the filenames in the models directory `aws-models -> service.VERSION.json`
excludeModels=rds-data.2018-08-01, groundstation.2019-05-23 

# comma separated list of services to generate from sdk-codegen. When not specified all services are generated
# specify service.VERSION matching the filenames in the models directory `aws-models -> service.VERSION.json`.
onlyIncludeModels=lambda.2015-03-31

# when generating aws services build as a standalong project or not (rootProject = true)
buildStandaloneSdk=true
```

**Note:** If a service is specified in both `excludeModels` and `onlyIncludeModels`, it will be excluded from generation. 


##### Building a single service
See the local.properties definition above to specify this in a config file.

```
>> ./gradlew -PonlyIncludeModels=lambda.2015-03-31  :sdk-codegen:build
```

##### Testing Locally
Testing generated services requires `ClientRuntime` of `smithy-swift` and `AWSClientRuntime` Swift packages.
