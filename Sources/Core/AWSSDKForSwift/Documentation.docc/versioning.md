# Versioning Policy

## Numbering

The AWS SDK for Swift uses the following versioning format:
```
<major>.<minor>.<patch>
```

The version components are incremented when one of the following occurs:
- `major`: Significant, breaking API changes.  New major versions will be
  very infrequent.  Expect to perform additional development to upgrade
  to a new major version.
- `minor`: Changes that are not major but may require attention from
  developers.  Specific changes will be detailed in release notes.
  Examples of minor changes may be:
  - Changes to behavior of existing features.
  - Deprecation of existing SDK features.
  - Dropping support for an Xcode, Swift, or platform version.
  - A significant internal change to an existing feature.
- `patch`: Less significant changes that should require no additional
  development to adopt and should not change SDK behavior.
  Patch releases will contain updates to the APIs for the AWS services.
  There is an unlikely possibility that patch changes to specific AWS
  services may break existing APIs; please file an
  [issue](https://github.com/awslabs/aws-sdk-swift/issues/new/choose)
  if this occurs.
  New patch versions are typically released each business day, with
  exceptions for holidays and certain AWS events.

## AWS Service Client Libraries

The AWS SDK for Swift includes a library for every AWS service (i.e. S3,
EC2, etc) that includes the service client, model types, and other
support code for accessing that AWS service.  Updating the SDK version
updates all of the service libraries that are in use, along with all of
the supporting runtime components.  In the future, we may elect to
publish services separately.

## Swift version and platform support

In order to ensure the maintainability and reliability of the AWS SDK
for Swift, we will, from time to time, drop support for Xcode/Swift versions
or OS versions for supported platforms.

At a minimum, we will support
Xcode/Swift versions for one year from their release, and platform OS versions
for two years from release.

See the SDK's
[Package.swift](https://github.com/awslabs/aws-sdk-swift/blob/main/Package.swift)
for the latest supported Swift versions & platforms.

## Public APIs

The AWS SDK for Swift consists of several modules which will
automatically install at build time.  The interfaces between these
modules are necessarily public, but not all are intended for use by
customers and may be altered in the future.  AWS SDK for Swift uses the
"System Programming Interface" (or SPI) feature to mark API features
that are not meant for customers to use.  If you find yourself needing
to access a public interface marked with the `@_spi` annotation, please start a
[discussion](https://github.com/awslabs/aws-sdk-swift/discussions/new/choose)
and the SDK developers will work with you to find a solution.
