# AcmClient

``` swift
public class AcmClient 
```

## Inheritance

[`AcmClientProtocol`](/aws-sdk-swift/reference/0.x/AWSACM/AcmClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `addTagsToCertificate(input:completion:)`

Adds one or more tags to an ACM certificate. Tags are labels that you can use to
identify and organize your Amazon Web Services resources. Each tag consists of a key and an
optional value. You specify the certificate on input by its Amazon Resource Name
(ARN). You specify the tag by using a key-value pair.

``` swift
public func addTagsToCertificate(input: AddTagsToCertificateInput, completion: @escaping (ClientRuntime.SdkResult<AddTagsToCertificateOutputResponse, AddTagsToCertificateOutputError>) -> Void)
```

``` 
     You can apply a tag to just one certificate if you want to identify a specific
  characteristic of that certificate, or you can apply the same tag to multiple certificates if
  you want to filter for a common relationship among those certificates. Similarly, you can
  apply the same tag to multiple resources if you want to specify a relationship among those
  resources. For example, you can add the same tag to an ACM certificate and an Elastic Load
  Balancing load balancer to indicate that they are both used by the same website. For more
  information, see <a href="https://docs.aws.amazon.com/acm/latest/userguide/tags.html">Tagging ACM
    certificates.

     To remove one or more tags, use the RemoveTagsFromCertificate action. To
  view all of the tags that have been applied to the certificate, use the ListTagsForCertificate action.
```

### `deleteCertificate(input:completion:)`

Deletes a certificate and its associated private key. If this action succeeds, the
certificate no longer appears in the list that can be displayed by calling the ListCertificates action or be retrieved by calling the GetCertificate action. The certificate will not be available for use by Amazon Web Services
services integrated with ACM.

``` swift
public func deleteCertificate(input: DeleteCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCertificateOutputResponse, DeleteCertificateOutputError>) -> Void)
```

``` 
        You cannot delete an ACM certificate that is being used by another Amazon Web Services service. To
    delete a certificate that is in use, the certificate association must first be
    removed.
```

### `describeCertificate(input:completion:)`

Returns detailed metadata about the specified ACM certificate.

``` swift
public func describeCertificate(input: DescribeCertificateInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCertificateOutputResponse, DescribeCertificateOutputError>) -> Void)
```

### `exportCertificate(input:completion:)`

Exports a private certificate issued by a private certificate authority (CA) for use
anywhere. The exported file contains the certificate, the certificate chain, and the encrypted
private 2048-bit RSA key associated with the public key that is embedded in the certificate.
For security, you must assign a passphrase for the private key when exporting it.
For information about exporting and formatting a certificate using the ACM console or
CLI, see <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/gs-acm-export-private.html">Export a
Private Certificate.

``` swift
public func exportCertificate(input: ExportCertificateInput, completion: @escaping (ClientRuntime.SdkResult<ExportCertificateOutputResponse, ExportCertificateOutputError>) -> Void)
```

### `getAccountConfiguration(input:completion:)`

Returns the account
configuration options associated with an Amazon Web Services account.

``` swift
public func getAccountConfiguration(input: GetAccountConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<GetAccountConfigurationOutputResponse, GetAccountConfigurationOutputError>) -> Void)
```

### `getCertificate(input:completion:)`

Retrieves an Amazon-issued certificate and its certificate chain. The chain consists of
the certificate of the issuing CA and the intermediate certificates of any other subordinate
CAs. All of the certificates are base64 encoded. You can use <a href="https:​//wiki.openssl.org/index.php/Command_Line_Utilities">OpenSSL to decode
the certificates and inspect individual fields.

``` swift
public func getCertificate(input: GetCertificateInput, completion: @escaping (ClientRuntime.SdkResult<GetCertificateOutputResponse, GetCertificateOutputError>) -> Void)
```

### `importCertificate(input:completion:)`

Imports a certificate into Amazon Web Services Certificate Manager (ACM) to use with services that are integrated with
ACM. Note that <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/acm-services.html">integrated
services allow only certificate types and keys they support to be associated with
their resources. Further, their support differs depending on whether the certificate is
imported into IAM or into ACM. For more information, see the documentation for each
service. For more information about importing certificates into ACM, see <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/import-certificate.html">Importing
Certificates in the Amazon Web Services Certificate Manager User Guide.

``` swift
public func importCertificate(input: ImportCertificateInput, completion: @escaping (ClientRuntime.SdkResult<ImportCertificateOutputResponse, ImportCertificateOutputError>) -> Void)
```

``` 
        ACM does not provide <a href="https://docs.aws.amazon.com/acm/latest/userguide/acm-renewal.html">managed renewal for certificates that you import.


     Note the following guidelines when importing third party certificates:




           You must enter the private key that matches the certificate you are importing.


           The private key must be unencrypted. You cannot import a private key that is protected
      by a password or a passphrase.


           The private key must be no larger than 5 KB (5,120 bytes).


           If the certificate you are importing is not self-signed, you must enter its
      certificate chain.


           If a certificate chain is included, the issuer must be the subject of one of the
      certificates in the chain.


           The certificate, private key, and certificate chain must be PEM-encoded.


           The current time must be between the Not Before and Not
        After certificate fields.


           The Issuer field must not be empty.


           The OCSP authority URL, if present, must not exceed 1000 characters.


           To import a new certificate, omit the CertificateArn argument. Include
      this argument only when you want to replace a previously imported certificate.


           When you import a certificate by using the CLI, you must specify the certificate, the
      certificate chain, and the private key by their file names preceded by
        fileb://. For example, you can specify a certificate saved in the
        C:\temp folder as fileb://C:\temp\certificate_to_import.pem.
      If you are making an HTTP or HTTPS Query request, include these arguments as BLOBs.



           When you import a certificate by using an SDK, you must specify the certificate, the
      certificate chain, and the private key files in the manner required by the programming
      language you're using.


           The cryptographic algorithm of an imported certificate must match the algorithm of the
      signing CA. For example, if the signing CA key type is RSA, then the certificate key type
      must also be RSA.



     This operation returns the <a href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
    Resource Name (ARN) of the imported certificate.
```

### `listCertificates(input:completion:)`

Retrieves a list of certificate ARNs and domain names. You can request that only
certificates that match a specific status be listed. You can also filter by specific
attributes of the certificate. Default filtering returns only RSA\_2048
certificates. For more information, see Filters.

``` swift
public func listCertificates(input: ListCertificatesInput, completion: @escaping (ClientRuntime.SdkResult<ListCertificatesOutputResponse, ListCertificatesOutputError>) -> Void)
```

### `listTagsForCertificate(input:completion:)`

Lists the tags that have been applied to the ACM certificate. Use the certificate's
Amazon Resource Name (ARN) to specify the certificate. To add a tag to an ACM certificate,
use the AddTagsToCertificate action. To delete a tag, use the RemoveTagsFromCertificate action.

``` swift
public func listTagsForCertificate(input: ListTagsForCertificateInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForCertificateOutputResponse, ListTagsForCertificateOutputError>) -> Void)
```

### `putAccountConfiguration(input:completion:)`

Adds or modifies
account-level configurations in ACM.

``` swift
public func putAccountConfiguration(input: PutAccountConfigurationInput, completion: @escaping (ClientRuntime.SdkResult<PutAccountConfigurationOutputResponse, PutAccountConfigurationOutputError>) -> Void)
```

``` 
     The
  supported configuration option is DaysBeforeExpiry. This option specifies the
  number of days prior to certificate expiration when ACM starts generating
    EventBridge events. ACM sends one event per day per certificate until the
  certificate expires. By default, accounts receive events starting 45 days before certificate
  expiration.
```

### `removeTagsFromCertificate(input:completion:)`

Remove one or more tags from an ACM certificate. A tag consists of a key-value pair. If
you do not specify the value portion of the tag when calling this function, the tag will be
removed regardless of value. If you specify a value, the tag is removed only if it is
associated with the specified value.

``` swift
public func removeTagsFromCertificate(input: RemoveTagsFromCertificateInput, completion: @escaping (ClientRuntime.SdkResult<RemoveTagsFromCertificateOutputResponse, RemoveTagsFromCertificateOutputError>) -> Void)
```

``` 
     To add tags to a certificate, use the AddTagsToCertificate action. To
  view all of the tags that have been applied to a specific ACM certificate, use the ListTagsForCertificate action.
```

### `renewCertificate(input:completion:)`

Renews an eligible ACM certificate. At this time, only exported private certificates can
be renewed with this operation. In order to renew your ACM PCA certificates with ACM, you must
first <a href="https:​//docs.aws.amazon.com/acm-pca/latest/userguide/PcaPermissions.html">grant the ACM
service principal permission to do so. For more information, see <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/manual-renewal.html">Testing Managed Renewal
in the ACM User Guide.

``` swift
public func renewCertificate(input: RenewCertificateInput, completion: @escaping (ClientRuntime.SdkResult<RenewCertificateOutputResponse, RenewCertificateOutputError>) -> Void)
```

### `requestCertificate(input:completion:)`

Requests an ACM certificate for use with other Amazon Web Services services. To request an ACM
certificate, you must specify a fully qualified domain name (FQDN) in the
DomainName parameter. You can also specify additional FQDNs in the
SubjectAlternativeNames parameter.
If you are requesting a private certificate, domain validation is not required. If you are
requesting a public certificate, each domain name that you specify must be validated to verify
that you own or control the domain. You can use <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html">DNS validation or <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-email.html">email validation.
We recommend that you use DNS validation. ACM issues public certificates after receiving
approval from the domain owner.

``` swift
public func requestCertificate(input: RequestCertificateInput, completion: @escaping (ClientRuntime.SdkResult<RequestCertificateOutputResponse, RequestCertificateOutputError>) -> Void)
```

``` 
        ACM behavior differs from the <a href="https://tools.ietf.org/html/rfc6125#appendix-B.2">https://tools.ietf.org/html/rfc6125#appendix-B.2RFC 6125 specification of the
    certificate validation process. first checks for a subject alternative name, and, if it
    finds one, ignores the common name (CN)
```

### `resendValidationEmail(input:completion:)`

Resends the email that requests domain ownership validation. The domain owner or an
authorized representative must approve the ACM certificate before it can be issued. The
certificate can be approved by clicking a link in the mail to navigate to the Amazon
certificate approval website and then clicking I Approve.
However, the validation email can be blocked by spam filters. Therefore, if you do not receive
the original mail, you can request that the mail be resent within 72 hours of requesting the
ACM certificate. If more than 72 hours have elapsed since your original request or since
your last attempt to resend validation mail, you must request a new certificate. For more
information about setting up your contact email addresses, see <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/setup-email.html">Configure Email for your Domain.

``` swift
public func resendValidationEmail(input: ResendValidationEmailInput, completion: @escaping (ClientRuntime.SdkResult<ResendValidationEmailOutputResponse, ResendValidationEmailOutputError>) -> Void)
```

### `updateCertificateOptions(input:completion:)`

Updates a certificate. Currently, you can use this function to specify whether to opt in
to or out of recording your certificate in a certificate transparency log. For more
information, see <a href="https:​//docs.aws.amazon.com/acm/latest/userguide/acm-bestpractices.html#best-practices-transparency"> Opting Out of
Certificate Transparency Logging.

``` swift
public func updateCertificateOptions(input: UpdateCertificateOptionsInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCertificateOptionsOutputResponse, UpdateCertificateOptionsOutputError>) -> Void)
```
