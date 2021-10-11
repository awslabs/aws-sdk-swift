# KmsClient

``` swift
public class KmsClient 
```

## Inheritance

[`KmsClientProtocol`](/aws-sdk-swift/reference/0.x/AWSKMS/KmsClientProtocol)

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

### `cancelKeyDeletion(input:completion:)`

Cancels the deletion of a KMS key. When this operation succeeds, the key
state of the KMS key is Disabled. To enable the KMS key, use EnableKey.
For more information about scheduling and canceling deletion of a KMS key, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting KMS keys in the Key Management Service Developer Guide.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func cancelKeyDeletion(input: CancelKeyDeletionInput, completion: @escaping (ClientRuntime.SdkResult<CancelKeyDeletionOutputResponse, CancelKeyDeletionOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.

        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CancelKeyDeletion (key policy)

        Related operations: ScheduleKeyDeletion
```

### `connectCustomKeyStore(input:completion:)`

Connects or reconnects a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store to its associated CloudHSM cluster.
The custom key store must be connected before you can create KMS keys
in the key store or use the KMS keys it contains. You can disconnect and reconnect a custom key
store at any time.
To connect a custom key store, its associated CloudHSM cluster must have at least one active
HSM. To get the number of active HSMs in a cluster, use the <a href="https:​//docs.aws.amazon.com/cloudhsm/latest/APIReference/API_DescribeClusters.html">DescribeClusters operation. To add HSMs
to the cluster, use the <a href="https:​//docs.aws.amazon.com/cloudhsm/latest/APIReference/API_CreateHsm.html">CreateHsm operation. Also, the <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
kmsuser crypto
user (CU) must not be logged into the cluster. This prevents KMS from using this
account to log in.
The connection process can take an extended amount of time to complete; up to 20 minutes.
This operation starts the connection process, but it does not wait for it to complete. When it
succeeds, this operation quickly returns an HTTP 200 response and a JSON object with no
properties. However, this response does not indicate that the custom key store is connected.
To get the connection state of the custom key store, use the DescribeCustomKeyStores operation.
During the connection process, KMS finds the CloudHSM cluster that is associated with the
custom key store, creates the connection infrastructure, connects to the cluster, logs into
the CloudHSM client as the kmsuser CU, and rotates its password.
The ConnectCustomKeyStore operation might fail for various reasons. To find
the reason, use the DescribeCustomKeyStores operation and see the
ConnectionErrorCode in the response. For help interpreting the
ConnectionErrorCode, see CustomKeyStoresListEntry.
To fix the failure, use the DisconnectCustomKeyStore operation to
disconnect the custom key store, correct the error, use the UpdateCustomKeyStore operation if necessary, and then use
ConnectCustomKeyStore again.
If you are having trouble connecting or disconnecting a custom key store, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting a Custom Key
Store in the Key Management Service Developer Guide.

``` swift
public func connectCustomKeyStore(input: ConnectCustomKeyStoreInput, completion: @escaping (ClientRuntime.SdkResult<ConnectCustomKeyStoreOutputResponse, ConnectCustomKeyStoreOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ConnectCustomKeyStore (IAM policy)

        Related operations




              CreateCustomKeyStore




              DeleteCustomKeyStore




              DescribeCustomKeyStores




              DisconnectCustomKeyStore




              UpdateCustomKeyStore
```

### `createAlias(input:completion:)`

Creates a friendly name for a KMS key.

``` swift
public func createAlias(input: CreateAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateAliasOutputResponse, CreateAliasOutputError>) -> Void)
```

``` 
        Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using ABAC in KMS in the Key Management Service Developer Guide.

     You can use an alias to identify a KMS key in the KMS console, in the DescribeKey operation and in <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations, such as Encrypt and
    GenerateDataKey. You can also change the KMS key that's associated with the
  alias (UpdateAlias) or delete the alias (DeleteAlias) at
  any time. These operations don't affect the underlying KMS key.
     You can associate the alias with any customer managed key in the same Amazon Web Services Region. Each
  alias is associated with only one KMS key at a time, but a KMS key can have multiple aliases. A valid KMS key is required. You can't create an alias without a KMS key.
     The alias must be unique in the account and Region, but you can have aliases with the same
  name in different Regions. For detailed information about aliases, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html">Using aliases in the
  Key Management Service Developer Guide.
     This operation does not return a response. To get the alias that you created, use the
    ListAliases operation.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: No. You cannot perform this operation on an alias in a different Amazon Web Services account.


        Required permissions




              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateAlias on the alias (IAM policy).



              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateAlias on the KMS key (key policy).


     For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling access to aliases in the Key Management Service Developer Guide.

        Related operations:




              DeleteAlias




              ListAliases




              UpdateAlias
```

### `createCustomKeyStore(input:completion:)`

Creates a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store that is associated with an <a href="https:​//docs.aws.amazon.com/cloudhsm/latest/userguide/clusters.html">CloudHSM cluster that you own and
manage.
This operation is part of the <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom Key Store feature feature in KMS, which
combines the convenience and extensive integration of KMS with the isolation and control of a
single-tenant key store.
Before you create the custom key store, you must assemble
the required elements, including an CloudHSM cluster that fulfills the requirements for a custom
key store. For details about the required elements, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/create-keystore.html#before-keystore">Assemble the Prerequisites
in the Key Management Service Developer Guide.
When the operation completes successfully, it returns the ID of the new custom key store.
Before you can use your new custom key store, you need to use the ConnectCustomKeyStore operation to connect the new key store to its CloudHSM
cluster. Even if you are not going to use your custom key store immediately, you might want to
connect it to verify that all settings are correct and then disconnect it until you are ready
to use it.
For help with failures, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting a Custom Key Store in the
Key Management Service Developer Guide.

``` swift
public func createCustomKeyStore(input: CreateCustomKeyStoreInput, completion: @escaping (ClientRuntime.SdkResult<CreateCustomKeyStoreOutputResponse, CreateCustomKeyStoreOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.

        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateCustomKeyStore (IAM policy).

        Related operations:




              ConnectCustomKeyStore




              DeleteCustomKeyStore




              DescribeCustomKeyStores




              DisconnectCustomKeyStore




              UpdateCustomKeyStore
```

### `createGrant(input:completion:)`

Adds a grant to a KMS key.
A grant is a policy instrument that allows Amazon Web Services principals to use KMS keys in cryptographic operations. It also can allow them to view a KMS key (DescribeKey) and create and manage grants. When authorizing access to a KMS key, grants are considered along with key policies and IAM policies. Grants are often used for
temporary permissions because you can create one, use its permissions, and delete it without
changing your key policies or IAM policies.
For detailed information about grants, including grant terminology, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using grants in the

``` swift
public func createGrant(input: CreateGrantInput, completion: @escaping (ClientRuntime.SdkResult<CreateGrantOutputResponse, CreateGrantOutputError>) -> Void)
```

``` 
           Key Management Service Developer Guide
        . For examples of working with grants in several
  programming languages, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming grants.
     The CreateGrant operation returns a GrantToken and a
  GrantId.


           When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as eventual consistency. Once the grant has achieved eventual consistency, the grantee principal
    can use the permissions in the grant without identifying the grant.
           However, to use the permissions in the grant immediately, use the
      GrantToken that CreateGrant returns. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#using-grant-token">Using a grant
        token in the
                 Key Management Service Developer Guide
              .


           The CreateGrant operation also returns a GrantId. You can use the
    GrantId and a key identifier to identify the grant in the RetireGrant and RevokeGrant operations. To find the grant
    ID, use the ListGrants or ListRetirableGrants
    operations.


     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key
```

ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateGrant (key policy)

        Related operations:




              ListGrants




              ListRetirableGrants




              RetireGrant




              RevokeGrant
```

### `createKey(input:completion:)`

Creates a unique customer managed <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms-keys">KMS key in your Amazon Web Services account and Region.

``` swift
public func createKey(input: CreateKeyInput, completion: @escaping (ClientRuntime.SdkResult<CreateKeyOutputResponse, CreateKeyOutputError>) -> Void)
```

``` 
        KMS is replacing the term customer master key (CMK) with KMS key and KMS key. The concept has not changed. To prevent breaking changes, KMS is keeping some variations of this term.


     You can use the CreateKey operation to create symmetric or asymmetric KMS keys.



              Symmetric KMS keys contain a 256-bit symmetric key that
      never leaves KMS unencrypted. To use the KMS key, you must call KMS. You can use a
      symmetric KMS key to encrypt and decrypt small amounts of data, but they are typically used to
      generate <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-keys">data
        keys and <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#data-key-pairs">data keys pairs. For details,
      see GenerateDataKey and GenerateDataKeyPair.



              Asymmetric KMS keys can contain an RSA key pair or an
      Elliptic Curve (ECC) key pair. The private key in an asymmetric KMS key never leaves KMS
      unencrypted. However, you can use the GetPublicKey operation to download
      the public key so it can be used outside of KMS. KMS keys with RSA key pairs can be used to
      encrypt or decrypt data or sign and verify messages (but not both). KMS keys with ECC key
      pairs can be used only to sign and verify messages.


     For information about symmetric and asymmetric KMS keys, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric KMS keys in the Key Management Service Developer Guide.


     To create different types of KMS keys, use the following guidance:


        Asymmetric KMS keys

           To create an asymmetric KMS key, use the KeySpec parameter to specify
        the type of key material in the KMS key. Then, use the KeyUsage parameter
        to determine whether the KMS key will be used to encrypt and decrypt or sign and verify.
        You can't change these properties after the KMS key is created.


        Symmetric KMS keys

           When creating a symmetric KMS key, you don't need to specify the
          KeySpec or KeyUsage parameters. The default value for
          KeySpec, SYMMETRIC_DEFAULT, and the default value for
          KeyUsage, ENCRYPT_DECRYPT, are the only valid values for
        symmetric KMS keys.


        Multi-Region primary keys
        Imported key material

           To create a multi-Region primary key in the local Amazon Web Services Region,
        use the MultiRegion parameter with a value of True. To create
        a multi-Region replica key, that is, a KMS key with the same key ID and
        key material as a primary key, but in a different Amazon Web Services Region, use the ReplicateKey operation. To change a replica key to a primary key, and its
        primary key to a replica key, use the UpdatePrimaryRegion
        operation.
           This operation supports multi-Region keys, an KMS feature that lets you create multiple
  interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key
  material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt
  it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using multi-Region keys in the Key Management Service Developer Guide.
           You can create symmetric and asymmetric multi-Region keys and multi-Region keys with
        imported key material. You cannot create multi-Region keys in a custom key store.



           To import your own key material, begin by creating a symmetric KMS key with no key
        material. To do this, use the Origin parameter of CreateKey
        with a value of EXTERNAL. Next, use GetParametersForImport operation to get a public key and import token, and use the public key to encrypt
        your key material. Then, use ImportKeyMaterial with your import token
        to import the key material. For step-by-step instructions, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material in the
                 Key Management Service Developer Guide
              . You
        cannot import the key material into an asymmetric KMS key.
           To create a multi-Region primary key with imported key material, use the
          Origin parameter of CreateKey with a value of
          EXTERNAL and the MultiRegion parameter with a value of
          True. To create replicas of the multi-Region primary key, use the ReplicateKey operation. For more information about multi-Region keys, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using multi-Region keys in the Key Management Service Developer Guide.


        Custom key store

           To create a symmetric KMS key in a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store, use the
          CustomKeyStoreId parameter to specify the custom key store. You must also
        use the Origin parameter with a value of AWS_CLOUDHSM. The
        CloudHSM cluster that is associated with the custom key store must have at least two active
        HSMs in different Availability Zones in the Amazon Web Services Region.
           You cannot create an asymmetric KMS key in a custom key store. For information about
        custom key stores in KMS see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Using Custom Key Stores in
        the
                 Key Management Service Developer Guide
              .



        Cross-account use:  No. You cannot use this operation to
  create a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:CreateKey (IAM policy). To use the
    Tags parameter, <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource (IAM policy). For examples and information about related
  permissions, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policy-example-create-key">Allow a user to create KMS keys in the Key Management Service Developer Guide.

        Related operations:




              DescribeKey




              ListKeys




              ScheduleKeyDeletion
```

### `decrypt(input:completion:)`

Decrypts ciphertext that was encrypted by a KMS key using any of
the following operations:​

``` swift
public func decrypt(input: DecryptInput, completion: @escaping (ClientRuntime.SdkResult<DecryptOutputResponse, DecryptOutputError>) -> Void)
```

``` 
              Encrypt




              GenerateDataKey




              GenerateDataKeyPair




              GenerateDataKeyWithoutPlaintext




              GenerateDataKeyPairWithoutPlaintext



     You can use this operation to decrypt ciphertext that was encrypted under a symmetric or
  asymmetric KMS key. When the KMS key is asymmetric, you must specify the KMS key and the encryption
  algorithm that was used to encrypt the ciphertext. For information about symmetric and asymmetric KMS keys, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric KMS keys in the Key Management Service Developer Guide.
     The Decrypt operation also decrypts ciphertext that was encrypted outside of KMS by the
  public key in an KMS asymmetric KMS key. However, it cannot decrypt ciphertext produced by other
  libraries, such as the <a href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">Amazon Web Services Encryption
    SDK or <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon S3 client-side encryption. These libraries return a ciphertext format that
  is incompatible with KMS.
     If the ciphertext was encrypted under a symmetric KMS key, the KeyId parameter is
  optional. KMS can get this information from metadata that it adds to the symmetric
  ciphertext blob. This feature adds durability to your implementation by ensuring that
  authorized users can decrypt ciphertext decades after it was encrypted, even if they've lost
  track of the key ID. However, specifying the KMS key is always recommended as a best practice.
  When you use the KeyId parameter to specify a KMS key, KMS only uses the KMS key you
  specify. If the ciphertext was encrypted under a different KMS key, the Decrypt
  operation fails. This practice ensures that you use the KMS key that you intend.
     Whenever possible, use key policies to give users permission to call the
    Decrypt operation on a particular KMS key, instead of using IAM policies.
  Otherwise, you might create an IAM user policy that gives the user Decrypt
  permission on all KMS keys. This user could decrypt ciphertext that was encrypted by KMS keys in other
  accounts if the key policy for the cross-account KMS key permits it. If you must use an IAM policy
  for Decrypt permissions, limit the user to particular KMS keys or particular trusted
  accounts. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/iam-policies.html#iam-policies-best-practices">Best practices for IAM policies in the Key Management Service Developer Guide.
     Applications in Amazon Web Services Nitro Enclaves can call this operation by using the <a href="https://github.com/aws/aws-nitro-enclaves-sdk-c">Amazon Web Services Nitro Enclaves Development Kit. For information about the supporting parameters, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html">How Amazon Web Services Nitro Enclaves use KMS in the Key Management Service Developer Guide.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Decrypt (key policy)

        Related operations:




              Encrypt




              GenerateDataKey




              GenerateDataKeyPair




              ReEncrypt
```

### `deleteAlias(input:completion:)`

Deletes the specified alias.

``` swift
public func deleteAlias(input: DeleteAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteAliasOutputResponse, DeleteAliasOutputError>) -> Void)
```

``` 
        Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using ABAC in KMS in the Key Management Service Developer Guide.

     Because an alias is not a property of a KMS key, you can delete and change the aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from the DescribeKey operation. To get the aliases of all KMS keys, use the ListAliases operation.
     Each KMS key can have multiple aliases. To change the alias of a KMS key, use DeleteAlias to delete the current alias and CreateAlias to
  create a new alias. To associate an existing alias with a different KMS key,
  call UpdateAlias.

        Cross-account use: No. You cannot perform this operation on an alias in a different Amazon Web Services account.

        Required permissions




              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteAlias on the alias (IAM policy).



              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteAlias on the KMS key (key policy).


     For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling access to aliases in the Key Management Service Developer Guide.

        Related operations:




              CreateAlias




              ListAliases




              UpdateAlias
```

### `deleteCustomKeyStore(input:completion:)`

Deletes a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store. This operation does not delete the CloudHSM cluster that is
associated with the custom key store, or affect any users or keys in the cluster.
The custom key store that you delete cannot contain any KMS <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#kms_keys">KMS keys. Before
deleting the key store, verify that you will never need to use any of the KMS keys in the key
store for any <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations. Then, use ScheduleKeyDeletion to delete the
KMS keys from the key store. When the scheduled waiting period
expires, the ScheduleKeyDeletion operation deletes the KMS keys. Then it makes a best
effort to delete the key material from the associated cluster. However, you might need to
manually <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key">delete the orphaned key
material from the cluster and its backups.
After all KMS keys are deleted from KMS, use DisconnectCustomKeyStore to
disconnect the key store from KMS. Then, you can delete the custom key store.
Instead of deleting the custom key store, consider using DisconnectCustomKeyStore to disconnect it from KMS. While the key store is
disconnected, you cannot create or use the KMS keys in the key store. But, you do not need to
delete KMS keys and you can reconnect a disconnected custom key store at any time.
If the operation succeeds, it returns a JSON object with no
properties.
This operation is part of the <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom Key Store feature feature in KMS, which
combines the convenience and extensive integration of KMS with the isolation and control of a
single-tenant key store.

``` swift
public func deleteCustomKeyStore(input: DeleteCustomKeyStoreInput, completion: @escaping (ClientRuntime.SdkResult<DeleteCustomKeyStoreOutputResponse, DeleteCustomKeyStoreOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteCustomKeyStore (IAM policy)

        Related operations:




              ConnectCustomKeyStore




              CreateCustomKeyStore




              DescribeCustomKeyStores




              DisconnectCustomKeyStore




              UpdateCustomKeyStore
```

### `deleteImportedKeyMaterial(input:completion:)`

Deletes key material that you previously imported. This operation makes the specified
KMS key unusable. For more information about importing key material into
KMS, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key
Material in the Key Management Service Developer Guide.
When the specified KMS key is in the PendingDeletion state, this operation does
not change the KMS key's state. Otherwise, it changes the KMS key's state to
PendingImport.
After you delete key material, you can use ImportKeyMaterial to reimport
the same key material into the KMS key.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func deleteImportedKeyMaterial(input: DeleteImportedKeyMaterialInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImportedKeyMaterialOutputResponse, DeleteImportedKeyMaterialOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DeleteImportedKeyMaterial (key policy)

        Related operations:




              GetParametersForImport




              ImportKeyMaterial
```

### `describeCustomKeyStores(input:completion:)`

Gets information about <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key stores in the account and Region.
This operation is part of the <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom Key Store feature feature in KMS, which
combines the convenience and extensive integration of KMS with the isolation and control of a
single-tenant key store.
By default, this operation returns information about all custom key stores in the account and
Region. To get only information about a particular custom key store, use either the
CustomKeyStoreName or CustomKeyStoreId parameter (but not
both).
To determine whether the custom key store is connected to its CloudHSM cluster, use the
ConnectionState element in the response. If an attempt to connect the custom
key store failed, the ConnectionState value is FAILED and the
ConnectionErrorCode element in the response indicates the cause of the failure.
For help interpreting the ConnectionErrorCode, see CustomKeyStoresListEntry.
Custom key stores have a DISCONNECTED connection state if the key store has
never been connected or you use the DisconnectCustomKeyStore operation to
disconnect it. If your custom key store state is CONNECTED but you are having
trouble using it, make sure that its associated CloudHSM cluster is active and contains the
minimum number of HSMs required for the operation, if any.
For help repairing your custom key store, see the <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html">Troubleshooting Custom Key Stores topic in the
Key Management Service Developer Guide.

``` swift
public func describeCustomKeyStores(input: DescribeCustomKeyStoresInput, completion: @escaping (ClientRuntime.SdkResult<DescribeCustomKeyStoresOutputResponse, DescribeCustomKeyStoresOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.

        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DescribeCustomKeyStores (IAM policy)

        Related operations:




              ConnectCustomKeyStore




              CreateCustomKeyStore




              DeleteCustomKeyStore




              DisconnectCustomKeyStore




              UpdateCustomKeyStore
```

### `describeKey(input:completion:)`

Provides detailed information about a KMS key. You can run
DescribeKey on a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer managed key or an <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon Web Services managed key.
This detailed information includes the key ARN, creation date (and deletion date, if
applicable), the key state, and the origin and expiration date (if any) of the key material.
It includes fields, like KeySpec, that help you distinguish symmetric from
asymmetric KMS keys. It also provides information that is particularly important to asymmetric
keys, such as the key usage (encryption or signing) and the encryption algorithms or signing
algorithms that the KMS key supports. For KMS keys in custom key stores, it includes information about
the custom key store, such as the key store ID and the CloudHSM cluster ID. For multi-Region
keys, it displays the primary key and all related replica keys.

``` swift
public func describeKey(input: DescribeKeyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeKeyOutputResponse, DescribeKeyOutputError>) -> Void)
```

``` 
        DescribeKey does not return the following information:


           Aliases associated with the KMS key. To get this information, use ListAliases.


           Whether automatic key rotation is enabled on the KMS key. To get this information, use
        GetKeyRotationStatus. Also, some key states prevent a KMS key from being
      automatically rotated. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-how-it-works">How Automatic Key Rotation
        Works in Key Management Service Developer Guide.


           Tags on the KMS key. To get this information, use ListResourceTags.


           Key policies and grants on the KMS key. To get this information, use GetKeyPolicy and ListGrants.


     If you call the DescribeKey operation on a predefined Amazon Web Services alias, that is, an Amazon Web Services alias with no key ID, KMS creates an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon Web Services managed key.
  Then, it associates the alias with the new KMS key, and returns the KeyId and
    Arn of the new KMS key in the response.

        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DescribeKey (key policy)

        Related operations:




              GetKeyPolicy




              GetKeyRotationStatus




              ListAliases




              ListGrants




              ListKeys




              ListResourceTags




              ListRetirableGrants
```

### `disableKey(input:completion:)`

Sets the state of a KMS key to disabled. This change temporarily
prevents use of the KMS key for <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations.
For more information about how key state affects the use of a KMS key, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the
Key Management Service Developer Guide
.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func disableKey(input: DisableKeyInput, completion: @escaping (ClientRuntime.SdkResult<DisableKeyOutputResponse, DisableKeyOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DisableKey (key policy)

        Related operations: EnableKey
```

### `disableKeyRotation(input:completion:)`

Disables <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
rotation of the key material for the specified symmetric KMS key.
You cannot enable automatic rotation of <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric KMS keys, KMS keys with <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported key material, or KMS keys in a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store. To enable or disable automatic rotation of a set of related <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-replica-key">multi-Region keys, set the property on the primary key.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func disableKeyRotation(input: DisableKeyRotationInput, completion: @escaping (ClientRuntime.SdkResult<DisableKeyRotationOutputResponse, DisableKeyRotationOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DisableKeyRotation (key policy)

        Related operations:




              EnableKeyRotation




              GetKeyRotationStatus
```

### `disconnectCustomKeyStore(input:completion:)`

Disconnects the <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store from its associated CloudHSM cluster. While a custom key
store is disconnected, you can manage the custom key store and its KMS keys, but you cannot create or use KMS keys in the custom key store. You can reconnect the
custom key store at any time.

``` swift
public func disconnectCustomKeyStore(input: DisconnectCustomKeyStoreInput, completion: @escaping (ClientRuntime.SdkResult<DisconnectCustomKeyStoreOutputResponse, DisconnectCustomKeyStoreOutputError>) -> Void)
```

``` 
        While a custom key store is disconnected, all attempts to create KMS keys in the custom key store or to use existing KMS keys in <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations will
    fail. This action can prevent users from storing and accessing sensitive data.


     To find the connection state of a custom key store, use the DescribeCustomKeyStores operation. To reconnect a custom key store, use the
    ConnectCustomKeyStore operation.
     If the operation succeeds, it returns a JSON object with no
```

properties.
This operation is part of the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom Key Store feature feature in KMS, which
combines the convenience and extensive integration of KMS with the isolation and control of a
single-tenant key store.

``` 
        Cross-account use: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:DisconnectCustomKeyStore (IAM policy)

        Related operations:




              ConnectCustomKeyStore




              CreateCustomKeyStore




              DeleteCustomKeyStore




              DescribeCustomKeyStores




              UpdateCustomKeyStore
```

### `enableKey(input:completion:)`

Sets the key state of a KMS key to enabled. This allows you to use the KMS key for <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#cryptographic-operations">cryptographic operations.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func enableKey(input: EnableKeyInput, completion: @escaping (ClientRuntime.SdkResult<EnableKeyOutputResponse, EnableKeyOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:EnableKey (key policy)

        Related operations: DisableKey
```

### `enableKeyRotation(input:completion:)`

Enables <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic rotation
of the key material for the specified symmetric KMS key.
You cannot enable automatic rotation of <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric KMS keys, KMS keys with <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported key material, or KMS keys in a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store. To enable or disable automatic rotation of a set of related <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-replica-key">multi-Region keys, set the property on the primary key.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func enableKeyRotation(input: EnableKeyRotationInput, completion: @escaping (ClientRuntime.SdkResult<EnableKeyRotationOutputResponse, EnableKeyRotationOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:EnableKeyRotation (key policy)

        Related operations:




              DisableKeyRotation




              GetKeyRotationStatus
```

### `encrypt(input:completion:)`

Encrypts plaintext into ciphertext by using a KMS key. The
Encrypt operation has two primary use cases:​

``` swift
public func encrypt(input: EncryptInput, completion: @escaping (ClientRuntime.SdkResult<EncryptOutputResponse, EncryptOutputError>) -> Void)
```

``` 
           You can encrypt small amounts of arbitrary data, such as a personal identifier or
      database password, or other sensitive information.


           You can use the Encrypt operation to move encrypted data from one Amazon Web Services Region to another. For example, in Region A, generate a data key and use the plaintext key to encrypt
      your data. Then, in Region A, use the Encrypt operation to encrypt the
      plaintext data key under a KMS key in Region B. Now, you can move the encrypted data and the
      encrypted data key to Region B. When necessary, you can decrypt the encrypted data key and
      the encrypted data entirely within in Region B.



     You don't need to use the Encrypt operation to encrypt a data key. The GenerateDataKey and GenerateDataKeyPair operations return a
  plaintext data key and an encrypted copy of that data key.

     When you encrypt data, you must specify a symmetric or asymmetric KMS key to use in the
  encryption operation. The KMS key must have a KeyUsage value of
    ENCRYPT_DECRYPT. To find the KeyUsage of a KMS key, use the DescribeKey operation.

     If you use a symmetric KMS key, you can use an encryption context to add additional security
  to your encryption operation. If you specify an EncryptionContext when encrypting
  data, you must specify the same encryption context (a case-sensitive exact match) when
  decrypting the data. Otherwise, the request to decrypt fails with an
    InvalidCiphertextException. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption
    Context in the Key Management Service Developer Guide.
     If you specify an asymmetric KMS key, you must also specify the encryption algorithm. The
  algorithm must be compatible with the KMS key type.

        When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.
        You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.



     The maximum size of the data that you can encrypt varies with the type of KMS key and the
  encryption algorithm that you choose.


           Symmetric KMS keys



                    SYMMETRIC_DEFAULT: 4096 bytes





              RSA_2048




                    RSAES_OAEP_SHA_1: 214 bytes



                    RSAES_OAEP_SHA_256: 190 bytes





              RSA_3072




                    RSAES_OAEP_SHA_1: 342 bytes



                    RSAES_OAEP_SHA_256: 318 bytes





              RSA_4096




                    RSAES_OAEP_SHA_1: 470 bytes



                    RSAES_OAEP_SHA_256: 446 bytes




     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Encrypt (key policy)

        Related operations:




              Decrypt




              GenerateDataKey




              GenerateDataKeyPair
```

### `generateDataKey(input:completion:)`

Generates a unique symmetric data key for client-side encryption. This operation returns a
plaintext copy of the data key and a copy that is encrypted under a KMS key
that you specify. You can use the plaintext key to encrypt your data outside of KMS and
store the encrypted data key with the encrypted data.

``` swift
public func generateDataKey(input: GenerateDataKeyInput, completion: @escaping (ClientRuntime.SdkResult<GenerateDataKeyOutputResponse, GenerateDataKeyOutputError>) -> Void)
```

``` 
        GenerateDataKey returns a unique data key for each request. The bytes in the
  plaintext key are not related to the caller or the KMS key.

     To generate a data key, specify the symmetric KMS key that will be used to encrypt the data
  key. You cannot use an asymmetric KMS key to generate data keys. To get the type of your KMS key, use
  the DescribeKey operation. You must also specify the length of the data key.
  Use either the KeySpec or NumberOfBytes parameters (but not both).
  For 128-bit and 256-bit data keys, use the KeySpec parameter.

     To get only an encrypted copy of the data key, use GenerateDataKeyWithoutPlaintext. To generate an asymmetric data key pair, use
  the GenerateDataKeyPair or GenerateDataKeyPairWithoutPlaintext operation. To get a cryptographically secure
  random byte string, use GenerateRandom.

     You can use the optional encryption context to add additional security to the encryption
  operation. If you specify an EncryptionContext, you must specify the same
  encryption context (a case-sensitive exact match) when decrypting the encrypted data key.
  Otherwise, the request to decrypt fails with an InvalidCiphertextException. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption Context in the
  Key Management Service Developer Guide.
     Applications in Amazon Web Services Nitro Enclaves can call this operation by using the <a href="https://github.com/aws/aws-nitro-enclaves-sdk-c">Amazon Web Services Nitro Enclaves Development Kit. For information about the supporting parameters, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html">How Amazon Web Services Nitro Enclaves use KMS in the Key Management Service Developer Guide.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        How to use your data key

     We recommend that you use the following pattern to encrypt data locally in your application.
  You can write your own code or use a client-side encryption library, such as the <a href="https://docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">Amazon Web Services Encryption SDK, the <a href="https://docs.aws.amazon.com/dynamodb-encryption-client/latest/devguide/">Amazon DynamoDB Encryption Client, or
    <a href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon S3
    client-side encryption to do these tasks for you.
     To encrypt data outside of KMS:
     <ol>

           Use the GenerateDataKey operation to get a data key.


           Use the plaintext data key (in the Plaintext field of the response) to
      encrypt your data outside of KMS. Then erase the plaintext data key from memory.


           Store the encrypted data key (in the CiphertextBlob field of the
      response) with the encrypted data.

     </ol>
     To decrypt data outside of KMS:
     <ol>

           Use the Decrypt operation to decrypt the encrypted data key. The
      operation returns a plaintext copy of the data key.


           Use the plaintext data key to decrypt data outside of KMS, then erase the plaintext
      data key from memory.

     </ol>

        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKey (key policy)

        Related operations:




              Decrypt




              Encrypt




              GenerateDataKeyPair




              GenerateDataKeyPairWithoutPlaintext




              GenerateDataKeyWithoutPlaintext
```

### `generateDataKeyPair(input:completion:)`

Generates a unique asymmetric data key pair. The GenerateDataKeyPair
operation returns a plaintext public key, a plaintext private key, and a copy of the private
key that is encrypted under the symmetric KMS key you specify. You can use the data key pair to
perform asymmetric cryptography and implement digital signatures outside of KMS.

``` swift
public func generateDataKeyPair(input: GenerateDataKeyPairInput, completion: @escaping (ClientRuntime.SdkResult<GenerateDataKeyPairOutputResponse, GenerateDataKeyPairOutputError>) -> Void)
```

``` 
     You can use the public key that GenerateDataKeyPair returns to encrypt data
  or verify a signature outside of KMS. Then, store the encrypted private key with the data.
  When you are ready to decrypt data or sign a message, you can use the Decrypt operation to decrypt the encrypted private key.

     To generate a data key pair, you must specify a symmetric KMS key to
  encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a
  custom key store. To get the type and origin of your KMS key, use the DescribeKey operation.
     Use the KeyPairSpec parameter to choose an RSA or Elliptic Curve (ECC) data
  key pair. KMS recommends that your use ECC key pairs for signing, and use RSA key pairs
  for either encryption or signing, but not both. However, KMS cannot enforce any restrictions
  on the use of data key pairs outside of KMS.

     If you are using the data key pair to encrypt data, or for any operation where you don't
  immediately need a private key, consider using the GenerateDataKeyPairWithoutPlaintext operation.
    GenerateDataKeyPairWithoutPlaintext returns a plaintext public key and an
  encrypted private key, but omits the plaintext private key that you need only to decrypt
  ciphertext or sign a message. Later, when you need to decrypt the data or sign a message, use
  the Decrypt operation to decrypt the encrypted private key in the data key
  pair.


        GenerateDataKeyPair returns a unique data key pair for each request. The
  bytes in the keys are not related to the caller or the KMS key that is used to encrypt the private
  key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in <a href="https://tools.ietf.org/html/rfc5280">RFC 5280. The
  private key is a DER-encoded PKCS8 PrivateKeyInfo, as specified in <a href="https://tools.ietf.org/html/rfc5958">RFC
    5958.

     You can use the optional encryption context to add additional security to the encryption
  operation. If you specify an EncryptionContext, you must specify the same
  encryption context (a case-sensitive exact match) when decrypting the encrypted data key.
  Otherwise, the request to decrypt fails with an InvalidCiphertextException. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption Context in the
  Key Management Service Developer Guide.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKeyPair (key policy)

        Related operations:




              Decrypt




              Encrypt




              GenerateDataKey




              GenerateDataKeyPairWithoutPlaintext




              GenerateDataKeyWithoutPlaintext
```

### `generateDataKeyPairWithoutPlaintext(input:completion:)`

Generates a unique asymmetric data key pair. The
GenerateDataKeyPairWithoutPlaintext operation returns a plaintext public key
and a copy of the private key that is encrypted under the symmetric KMS key you specify. Unlike
GenerateDataKeyPair, this operation does not return a plaintext private
key.
You can use the public key that GenerateDataKeyPairWithoutPlaintext returns
to encrypt data or verify a signature outside of KMS. Then, store the encrypted private key
with the data. When you are ready to decrypt data or sign a message, you can use the Decrypt operation to decrypt the encrypted private key.
To generate a data key pair, you must specify a symmetric KMS key to
encrypt the private key in a data key pair. You cannot use an asymmetric KMS key or a KMS key in a
custom key store. To get the type and origin of your KMS key, use the DescribeKey operation.
Use the KeyPairSpec parameter to choose an RSA or Elliptic Curve (ECC) data
key pair. KMS recommends that your use ECC key pairs for signing, and use RSA key pairs
for either encryption or signing, but not both. However, KMS cannot enforce any restrictions
on the use of data key pairs outside of KMS.

``` swift
public func generateDataKeyPairWithoutPlaintext(input: GenerateDataKeyPairWithoutPlaintextInput, completion: @escaping (ClientRuntime.SdkResult<GenerateDataKeyPairWithoutPlaintextOutputResponse, GenerateDataKeyPairWithoutPlaintextOutputError>) -> Void)
```

``` 
        GenerateDataKeyPairWithoutPlaintext returns a unique data key pair for each
  request. The bytes in the key are not related to the caller or KMS key that is used to encrypt the
  private key. The public key is a DER-encoded X.509 SubjectPublicKeyInfo, as specified in
    <a href="https://tools.ietf.org/html/rfc5280">RFC 5280.

     You can use the optional encryption context to add additional security to the encryption
  operation. If you specify an EncryptionContext, you must specify the same
  encryption context (a case-sensitive exact match) when decrypting the encrypted data key.
  Otherwise, the request to decrypt fails with an InvalidCiphertextException. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption Context in the
  Key Management Service Developer Guide.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKeyPairWithoutPlaintext (key policy)

        Related operations:




              Decrypt




              Encrypt




              GenerateDataKey




              GenerateDataKeyPair




              GenerateDataKeyWithoutPlaintext
```

### `generateDataKeyWithoutPlaintext(input:completion:)`

Generates a unique symmetric data key. This operation returns a data key that is encrypted
under a KMS key that you specify. To request an asymmetric data key pair,
use the GenerateDataKeyPair or GenerateDataKeyPairWithoutPlaintext operations.

``` swift
public func generateDataKeyWithoutPlaintext(input: GenerateDataKeyWithoutPlaintextInput, completion: @escaping (ClientRuntime.SdkResult<GenerateDataKeyWithoutPlaintextOutputResponse, GenerateDataKeyWithoutPlaintextOutputError>) -> Void)
```

``` 
        GenerateDataKeyWithoutPlaintext is identical to the GenerateDataKey operation except that returns only the encrypted copy of the
  data key. This operation is useful for systems that need to encrypt data at some point, but
  not immediately. When you need to encrypt the data, you call the Decrypt
  operation on the encrypted copy of the key.
     It's also useful in distributed systems with different levels of trust. For example, you
  might store encrypted data in containers. One component of your system creates new containers
  and stores an encrypted data key with each container. Then, a different component puts the
  data into the containers. That component first decrypts the data key, uses the plaintext data
  key to encrypt data, puts the encrypted data into the container, and then destroys the
  plaintext data key. In this system, the component that creates the containers never sees the
  plaintext data key.

        GenerateDataKeyWithoutPlaintext returns a unique data key for each request.
  The bytes in the keys are not related to the caller or KMS key that is used to encrypt the private
  key.

     To generate a data key, you must specify the symmetric KMS key that is
  used to encrypt the data key. You cannot use an asymmetric KMS key to generate a data key. To get
  the type of your KMS key, use the DescribeKey operation.

     If the operation succeeds, you will find the encrypted copy of the data key in the
    CiphertextBlob field.

     You can use the optional encryption context to add additional security to the encryption
  operation. If you specify an EncryptionContext, you must specify the same
  encryption context (a case-sensitive exact match) when decrypting the encrypted data key.
  Otherwise, the request to decrypt fails with an InvalidCiphertextException. For more information, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">Encryption Context in the
  Key Management Service Developer Guide.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateDataKeyWithoutPlaintext (key policy)

        Related operations:




              Decrypt




              Encrypt




              GenerateDataKey




              GenerateDataKeyPair




              GenerateDataKeyPairWithoutPlaintext
```

### `generateRandom(input:completion:)`

Returns a random byte string that is cryptographically secure.
By default, the random byte string is generated in KMS. To generate the byte string in
the CloudHSM cluster that is associated with a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store, specify the custom key store
ID.
Applications in Amazon Web Services Nitro Enclaves can call this operation by using the <a href="https:​//github.com/aws/aws-nitro-enclaves-sdk-c">Amazon Web Services Nitro Enclaves Development Kit. For information about the supporting parameters, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/services-nitro-enclaves.html">How Amazon Web Services Nitro Enclaves use KMS in the Key Management Service Developer Guide.
For more information about entropy and random number generation, see <a href="https:​//docs.aws.amazon.com/kms/latest/cryptographic-details/">Key Management Service Cryptographic Details.

``` swift
public func generateRandom(input: GenerateRandomInput, completion: @escaping (ClientRuntime.SdkResult<GenerateRandomOutputResponse, GenerateRandomOutputError>) -> Void)
```

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GenerateRandom (IAM policy)
```

### `getKeyPolicy(input:completion:)`

Gets a key policy attached to the specified KMS key.

``` swift
public func getKeyPolicy(input: GetKeyPolicyInput, completion: @escaping (ClientRuntime.SdkResult<GetKeyPolicyOutputResponse, GetKeyPolicyOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetKeyPolicy (key policy)

        Related operations: PutKeyPolicy
```

### `getKeyRotationStatus(input:completion:)`

Gets a Boolean value that indicates whether <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic rotation of the key material is
enabled for the specified KMS key.
You cannot enable automatic rotation of <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric KMS keys, KMS keys with <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">imported key material, or KMS keys in a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store. To enable or disable automatic rotation of a set of related <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html#mrk-replica-key">multi-Region keys, set the property on the primary key. The key rotation status for these KMS keys is always false.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func getKeyRotationStatus(input: GetKeyRotationStatusInput, completion: @escaping (ClientRuntime.SdkResult<GetKeyRotationStatusOutputResponse, GetKeyRotationStatusOutputError>) -> Void)
```

``` 
           Disabled: The key rotation status does not change when you disable a KMS key. However,
      while the KMS key is disabled, KMS does not rotate the key material.


           Pending deletion: While a KMS key is pending deletion, its key rotation status is
        false and KMS does not rotate the key material. If you cancel the
      deletion, the original key rotation status is restored.



        Cross-account use: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key
```

ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetKeyRotationStatus (key policy)

        Related operations:




              DisableKeyRotation




              EnableKeyRotation
```

### `getParametersForImport(input:completion:)`

Returns the items you need to import key material into a symmetric, customer managed
KMS key. For more information about importing key material into KMS, see
<a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key
Material in the Key Management Service Developer Guide.
This operation returns a public key and an import token. Use the public key to encrypt the
symmetric key material. Store the import token to send with a subsequent ImportKeyMaterial request.
You must specify the key ID of the symmetric KMS key into which you will import key material.
This KMS key's Origin must be EXTERNAL. You must also specify the
wrapping algorithm and type of wrapping key (public key) that you will use to encrypt the key
material. You cannot perform this operation on an asymmetric KMS key or on any KMS key in a different Amazon Web Services account.
To import key material, you must use the public key and import token from the same
response. These items are valid for 24 hours. The expiration date and time appear in the
GetParametersForImport response. You cannot use an expired token in an ImportKeyMaterial request. If your key and token expire, send another
GetParametersForImport request.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func getParametersForImport(input: GetParametersForImportInput, completion: @escaping (ClientRuntime.SdkResult<GetParametersForImportOutputResponse, GetParametersForImportOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetParametersForImport (key policy)

        Related operations:




              ImportKeyMaterial




              DeleteImportedKeyMaterial
```

### `getPublicKey(input:completion:)`

Returns the public key of an asymmetric KMS key. Unlike the private key of a asymmetric KMS key,
which never leaves KMS unencrypted, callers with kms:​GetPublicKey permission
can download the public key of an asymmetric KMS key. You can share the public key to allow others
to encrypt messages and verify signatures outside of KMS. For information about symmetric and asymmetric KMS keys, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric KMS keys in the Key Management Service Developer Guide.
You do not need to download the public key. Instead, you can use the public key within
KMS by calling the Encrypt, ReEncrypt, or Verify operations with the identifier of an asymmetric KMS key. When you use the
public key within KMS, you benefit from the authentication, authorization, and logging that
are part of every KMS operation. You also reduce of risk of encrypting data that cannot be
decrypted. These features are not effective outside of KMS. For details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/download-public-key.html#download-public-key-considerations">Special
Considerations for Downloading Public Keys.
To help you use the public key safely outside of KMS, GetPublicKey returns
important information about the public key in the response, including:​

``` swift
public func getPublicKey(input: GetPublicKeyInput, completion: @escaping (ClientRuntime.SdkResult<GetPublicKeyOutputResponse, GetPublicKeyOutputError>) -> Void)
```

``` 
              <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeySpec">KeySpec: The type of key material in the public key, such as
        RSA_4096 or ECC_NIST_P521.



              <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-KeyUsage">KeyUsage: Whether the key is used for encryption or signing.



              <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-EncryptionAlgorithms">EncryptionAlgorithms or <a href="https://docs.aws.amazon.com/kms/latest/APIReference/API_GetPublicKey.html#KMS-GetPublicKey-response-SigningAlgorithms">SigningAlgorithms: A list of the encryption algorithms or the signing
      algorithms for the key.


     Although KMS cannot enforce these restrictions on external operations, it is crucial
  that you use this information to prevent the public key from being used improperly. For
  example, you can prevent a public signing key from being used encrypt data, or prevent a
  public key from being used with an encryption algorithm that is not supported by KMS. You
  can also avoid errors, such as using the wrong signing algorithm in a verification
  operation.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:GetPublicKey (key policy)

        Related operations: CreateKey
```

### `importKeyMaterial(input:completion:)`

Imports key material into an existing symmetric KMS KMS key that was
created without key material. After you successfully import key material into a KMS key, you can
<a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#reimport-key-material">reimport the same key material into that KMS key, but you cannot import different key
material.
You cannot perform this operation on an asymmetric KMS key or on any KMS key in a different Amazon Web Services account. For more information about creating KMS keys with no key material and
then importing key material, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html">Importing Key Material in the
Key Management Service Developer Guide.
Before using this operation, call GetParametersForImport. Its response
includes a public key and an import token. Use the public key to encrypt the key material.
Then, submit the import token from the same GetParametersForImport
response.
When calling this operation, you must specify the following values:​

``` swift
public func importKeyMaterial(input: ImportKeyMaterialInput, completion: @escaping (ClientRuntime.SdkResult<ImportKeyMaterialOutputResponse, ImportKeyMaterialOutputError>) -> Void)
```

``` 
           The key ID or key ARN of a KMS key with no key material. Its Origin must be
        EXTERNAL.
           To create a KMS key with no key material, call CreateKey and set the
      value of its Origin parameter to EXTERNAL. To get the
        Origin of a KMS key, call DescribeKey.)


           The encrypted key material. To get the public key to encrypt the key material, call
        GetParametersForImport.


           The import token that GetParametersForImport returned. You must use
      a public key and token from the same GetParametersForImport response.


           Whether the key material expires and if so, when. If you set an expiration date, KMS
      deletes the key material from the KMS key on the specified date, and the KMS key becomes unusable.
      To use the KMS key again, you must reimport the same key material. The only way to change an
      expiration date is by reimporting the same key material and specifying a new expiration
      date.


     When this operation is successful, the key state of the KMS key changes from
    PendingImport to Enabled, and you can use the KMS key.
     If this operation fails, use the exception to help determine the problem. If the error is
  related to the key material, the import token, or wrapping key, use GetParametersForImport to get a new public key and import token for the KMS key and
  repeat the import procedure. For help, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/importing-keys.html#importing-keys-overview">How To Import Key
    Material in the Key Management Service Developer Guide.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ImportKeyMaterial (key policy)

        Related operations:




              DeleteImportedKeyMaterial




              GetParametersForImport
```

### `listAliases(input:completion:)`

Gets a list of aliases in the caller's Amazon Web Services account and region. For more information about
aliases, see CreateAlias.
By default, the ListAliases operation returns all aliases in the account and
region. To get only the aliases associated with a particular KMS key, use
the KeyId parameter.
The ListAliases response can include aliases that you created and associated
with your customer managed keys, and aliases that Amazon Web Services created and associated with Amazon Web Services managed keys in your account. You can recognize Amazon Web Services aliases because their names have the format
aws/<service-name>, such as aws/dynamodb.
The response might also include aliases that have no TargetKeyId field. These
are predefined aliases that Amazon Web Services has created but has not yet associated with a KMS key. Aliases
that Amazon Web Services creates in your account, including predefined aliases, do not count against your
<a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/limits.html#aliases-limit">KMS aliases
quota.

``` swift
public func listAliases(input: ListAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListAliasesOutputResponse, ListAliasesOutputError>) -> Void)
```

``` 
        Cross-account use: No. ListAliases does not
  return aliases in other Amazon Web Services accounts.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListAliases (IAM policy)
     For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling access to aliases in the Key Management Service Developer Guide.

        Related operations:




              CreateAlias




              DeleteAlias




              UpdateAlias
```

### `listGrants(input:completion:)`

Gets a list of all grants for the specified KMS key.
You must specify the KMS key in all requests. You can filter the grant list by grant ID
or grantee principal.
For detailed information about grants, including grant terminology, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using grants in the

``` swift
public func listGrants(input: ListGrantsInput, completion: @escaping (ClientRuntime.SdkResult<ListGrantsOutputResponse, ListGrantsOutputError>) -> Void)
```

``` 
           Key Management Service Developer Guide
        . For examples of working with grants in several
  programming languages, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming grants.

        The GranteePrincipal field in the ListGrants response usually contains the
    user or role designated as the grantee principal in the grant. However, when the grantee
    principal in the grant is an Amazon Web Services service, the GranteePrincipal field contains
    the <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#principal-services">service
      principal, which might represent several different grantee principals.


        Cross-account use: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key
```

ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListGrants (key policy)

        Related operations:




              CreateGrant




              ListRetirableGrants




              RetireGrant




              RevokeGrant
```

### `listKeyPolicies(input:completion:)`

Gets the names of the key policies that are attached to a KMS key. This
operation is designed to get policy names that you can use in a GetKeyPolicy
operation. However, the only valid policy name is default.

``` swift
public func listKeyPolicies(input: ListKeyPoliciesInput, completion: @escaping (ClientRuntime.SdkResult<ListKeyPoliciesOutputResponse, ListKeyPoliciesOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListKeyPolicies (key policy)

        Related operations:




              GetKeyPolicy




              PutKeyPolicy
```

### `listKeys(input:completion:)`

Gets a list of all KMS keys in the caller's Amazon Web Services account and
Region.

``` swift
public func listKeys(input: ListKeysInput, completion: @escaping (ClientRuntime.SdkResult<ListKeysOutputResponse, ListKeysOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListKeys (IAM policy)

        Related operations:




              CreateKey




              DescribeKey




              ListAliases




              ListResourceTags
```

### `listResourceTags(input:completion:)`

Returns all tags on the specified KMS key.
For general information about tags, including the format and syntax, see <a href="https:​//docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging Amazon Web Services resources in
the Amazon Web Services General Reference. For information about using
tags in KMS, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging
keys.

``` swift
public func listResourceTags(input: ListResourceTagsInput, completion: @escaping (ClientRuntime.SdkResult<ListResourceTagsOutputResponse, ListResourceTagsOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListResourceTags (key policy)

        Related operations:




              CreateKey




              ReplicateKey




              TagResource




              UntagResource
```

### `listRetirableGrants(input:completion:)`

Returns information about all grants in the Amazon Web Services account and Region that have the specified
retiring principal.
You can specify any principal in your Amazon Web Services account. The grants that are returned include
grants for KMS keys in your Amazon Web Services account and other Amazon Web Services accounts. You might use this operation to
determine which grants you may retire. To retire a grant, use the RetireGrant operation.
For detailed information about grants, including grant terminology, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using grants in the

``` swift
public func listRetirableGrants(input: ListRetirableGrantsInput, completion: @escaping (ClientRuntime.SdkResult<ListRetirableGrantsOutputResponse, ListRetirableGrantsOutputError>) -> Void)
```

``` 
           Key Management Service Developer Guide
        . For examples of working with grants in several
  programming languages, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming grants.

        Cross-account use: You must specify a principal in your
  Amazon Web Services account. However, this operation can return grants in any Amazon Web Services account. You do not need
  kms:ListRetirableGrants permission (or any other additional permission) in any
  Amazon Web Services account other than your own.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ListRetirableGrants (IAM policy) in your Amazon Web Services account.

        Related operations:




              CreateGrant




              ListGrants




              RetireGrant




              RevokeGrant
```

### `putKeyPolicy(input:completion:)`

Attaches a key policy to the specified KMS key.
For more information about key policies, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Key Policies in the Key Management Service Developer Guide.
For help writing and formatting a JSON policy document, see the <a href="https:​//docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html">IAM JSON Policy Reference in the
Identity and Access Management User Guide
. For examples of adding a key policy in multiple programming languages,
see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/programming-key-policies.html#put-policy">Setting a key policy in the Key Management Service Developer Guide.

``` swift
public func putKeyPolicy(input: PutKeyPolicyInput, completion: @escaping (ClientRuntime.SdkResult<PutKeyPolicyOutputResponse, PutKeyPolicyOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:PutKeyPolicy (key policy)

        Related operations: GetKeyPolicy
```

### `reEncrypt(input:completion:)`

Decrypts ciphertext and then reencrypts it entirely within KMS. You can use this
operation to change the KMS key under which data is encrypted, such as when
you <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html#rotate-keys-manually">manually rotate a KMS key or change the KMS key that protects a ciphertext. You can also
use it to reencrypt ciphertext under the same KMS key, such as to change the <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context">encryption
context of a ciphertext.
The ReEncrypt operation can decrypt ciphertext that was encrypted by using an
KMS KMS key in an KMS operation, such as Encrypt or GenerateDataKey. It can also decrypt ciphertext that was encrypted by using the
public key of an <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html#asymmetric-cmks">asymmetric KMS key outside of KMS. However, it cannot decrypt ciphertext
produced by other libraries, such as the <a href="https:​//docs.aws.amazon.com/encryption-sdk/latest/developer-guide/">Amazon Web Services Encryption SDK or <a href="https:​//docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html">Amazon S3 client-side encryption.
These libraries return a ciphertext format that is incompatible with KMS.
When you use the ReEncrypt operation, you need to provide information for the
decrypt operation and the subsequent encrypt operation.

``` swift
public func reEncrypt(input: ReEncryptInput, completion: @escaping (ClientRuntime.SdkResult<ReEncryptOutputResponse, ReEncryptOutputError>) -> Void)
```

``` 
           If your ciphertext was encrypted under an asymmetric KMS key, you must use the
        SourceKeyId parameter to identify the KMS key that encrypted the ciphertext.
      You must also supply the encryption algorithm that was used. This information is required
      to decrypt the data.


           If your ciphertext was encrypted under a symmetric KMS key, the SourceKeyId
      parameter is optional. KMS can get this information from metadata that it adds to the
      symmetric ciphertext blob. This feature adds durability to your implementation by ensuring
      that authorized users can decrypt ciphertext decades after it was encrypted, even if
      they've lost track of the key ID. However, specifying the source KMS key is always recommended
      as a best practice. When you use the SourceKeyId parameter to specify a KMS key,
      KMS uses only the KMS key you specify. If the ciphertext was encrypted under a different KMS key, the ReEncrypt operation fails. This practice ensures that you use the KMS key that you intend.


           To reencrypt the data, you must use the DestinationKeyId parameter
      specify the KMS key that re-encrypts the data after it is decrypted. You can select a
      symmetric or asymmetric KMS key. If the destination KMS key is an asymmetric KMS key, you must also
      provide the encryption algorithm. The algorithm that you choose must be compatible with
      the KMS key.


              When you use an asymmetric KMS key to encrypt or reencrypt data, be sure to record the KMS key and encryption algorithm that you choose. You will be required to provide the same KMS key and encryption algorithm when you decrypt the data. If the KMS key and algorithm do not match the values used to encrypt the data, the decrypt operation fails.
              You are not required to supply the key ID and encryption algorithm when you decrypt with symmetric KMS keys because KMS stores this information in the ciphertext blob. KMS cannot store metadata in ciphertext generated with asymmetric keys. The standard format for asymmetric key ciphertext does not include configurable fields.






     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. The source KMS key and destination KMS key can be in different Amazon Web Services accounts. Either or both KMS keys can be in a different account than
  the caller. To specify a KMS key in a different account, you must use its key ARN or alias
  ARN.


        Required permissions:



              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ReEncryptFrom permission on the source KMS key (key policy)



              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:ReEncryptTo permission on the destination KMS key (key policy)


     To permit reencryption from or to a KMS key, include the "kms:ReEncrypt*"
  permission in your <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">key policy. This permission is
  automatically included in the key policy when you use the console to create a KMS key. But you
  must include it manually when you create a KMS key programmatically or when you use the PutKeyPolicy operation to set a key policy.


        Related operations:




              Decrypt




              Encrypt




              GenerateDataKey




              GenerateDataKeyPair
```

### `replicateKey(input:completion:)`

Replicates a multi-Region key into the specified Region. This operation creates a
multi-Region replica key based on a multi-Region primary key in a different Region of the same
Amazon Web Services partition. You can create multiple replicas of a primary key, but each must be in a
different Region. To create a multi-Region primary key, use the CreateKey
operation.
This operation supports multi-Region keys, an KMS feature that lets you create multiple
interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key
material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt
it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using multi-Region keys in the Key Management Service Developer Guide.
A replica key is a fully-functional KMS key that can be used
independently of its primary and peer replica keys. A primary key and its replica keys share
properties that make them interoperable. They have the same <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id">key ID and key material. They also
have the same <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec">key
spec, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage">key
usage, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin">key
material origin, and <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic key rotation status. KMS automatically synchronizes these shared
properties among related multi-Region keys. All other properties of a replica key can differ,
including its <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">key
policy, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">tags, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html">aliases, and <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">key
state. KMS pricing and quotas for KMS keys apply to each primary key and replica
key.
When this operation completes, the new replica key has a transient key state of
Creating. This key state changes to Enabled (or
PendingImport) after a few seconds when the process of creating the new replica
key is complete. While the key state is Creating, you can manage key, but you
cannot yet use it in cryptographic operations. If you are creating and using the replica key
programmatically, retry on KMSInvalidStateException or call
DescribeKey to check its KeyState value before using it. For
details about the Creating key state, see <a href="kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the
Key Management Service Developer Guide.
The CloudTrail log of a ReplicateKey operation records a
ReplicateKey operation in the primary key's Region and a CreateKey operation in the replica key's Region.
If you replicate a multi-Region primary key with imported key material, the replica key is
created with no key material. You must import the same key material that you imported into the
primary key. For details, see <a href="kms/latest/developerguide/multi-region-keys-import.html">Importing key material into multi-Region keys in the Key Management Service Developer Guide.
To convert a replica key to a primary key, use the UpdatePrimaryRegion
operation.

``` swift
public func replicateKey(input: ReplicateKeyInput, completion: @escaping (ClientRuntime.SdkResult<ReplicateKeyOutputResponse, ReplicateKeyOutputError>) -> Void)
```

``` 
           ReplicateKey uses different default values for the KeyPolicy and
      Tags parameters than those used in the KMS console. For details, see the
    parameter descriptions.


        Cross-account use: No. You cannot use this operation to
  create a replica key in a different Amazon Web Services account.

        Required permissions:



              kms:ReplicateKey on the primary key (in the primary key's Region). Include this
      permission in the primary key's key policy.



              kms:CreateKey in an IAM policy in the replica Region.


           To use the Tags parameter, kms:TagResource in an IAM policy
      in the replica Region.



        Related operations




              CreateKey




              UpdatePrimaryRegion
```

### `retireGrant(input:completion:)`

Deletes a grant. Typically, you retire a grant when you no longer need its permissions. To
identify the grant to retire, use a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grants.html#grant_token">grant token, or both the grant ID and a
key identifier (key ID or key ARN) of the KMS key. The CreateGrant operation returns both values.
This operation can be called by the retiring principal for a grant,
by the grantee principal if the grant allows the RetireGrant
operation, and by the Amazon Web Services account (root user) in which the grant is created. It can also be
called by principals to whom permission for retiring a grant is delegated. For details, see
<a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete">Retiring and
revoking grants in the Key Management Service Developer Guide.
For detailed information about grants, including grant terminology, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using grants in the

``` swift
public func retireGrant(input: RetireGrantInput, completion: @escaping (ClientRuntime.SdkResult<RetireGrantOutputResponse, RetireGrantOutputError>) -> Void)
```

``` 
           Key Management Service Developer Guide
        . For examples of working with grants in several
  programming languages, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming grants.

        Cross-account use: Yes. You can retire a grant on a KMS key
  in a different Amazon Web Services account.

        Required permissions::Permission to retire a grant is
  determined primarily by the grant. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/grant-manage.html#grant-delete">Retiring and revoking grants in the Key Management Service Developer Guide.

        Related operations:




              CreateGrant




              ListGrants




              ListRetirableGrants




              RevokeGrant
```

### `revokeGrant(input:completion:)`

Deletes the specified grant. You revoke a grant to terminate the permissions that the
grant allows. For more
information, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/managing-grants.html#grant-delete">Retiring and revoking grants in
the
Key Management Service Developer Guide
.
When you create, retire, or revoke a grant, there might be a brief delay, usually less than five minutes, until the grant is available throughout KMS. This state is known as eventual consistency. For details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grants.html#terms-eventual-consistency">Eventual consistency in
the
Key Management Service Developer Guide
.
For detailed information about grants, including grant terminology, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/grants.html">Using grants in the

``` swift
public func revokeGrant(input: RevokeGrantInput, completion: @escaping (ClientRuntime.SdkResult<RevokeGrantOutputResponse, RevokeGrantOutputError>) -> Void)
```

``` 
           Key Management Service Developer Guide
        . For examples of working with grants in several
  programming languages, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/programming-grants.html">Programming grants.

        Cross-account use: Yes. To perform this operation on a KMS key in a different Amazon Web Services account, specify the key
```

ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:RevokeGrant (key policy).

        Related operations:




              CreateGrant




              ListGrants




              ListRetirableGrants




              RetireGrant
```

### `scheduleKeyDeletion(input:completion:)`

Schedules the deletion of a KMS key. By default, KMS applies a waiting
period of 30 days, but you can specify a waiting period of 7-30 days. When this operation is
successful, the key state of the KMS key changes to PendingDeletion and the key can't
be used in any cryptographic operations. It remains in this state for the duration of the
waiting period. Before the waiting period ends, you can use CancelKeyDeletion to cancel the deletion of the KMS key. After the waiting period ends, KMS deletes the KMS key,
its key material, and all KMS data associated with it, including all aliases that refer to
it.

``` swift
public func scheduleKeyDeletion(input: ScheduleKeyDeletionInput, completion: @escaping (ClientRuntime.SdkResult<ScheduleKeyDeletionOutputResponse, ScheduleKeyDeletionOutputError>) -> Void)
```

``` 
        Deleting a KMS key is a destructive and potentially dangerous operation. When a KMS key is
    deleted, all data that was encrypted under the KMS key is unrecoverable. (The only exception is
    a multi-Region replica key.) To prevent the use of a KMS key without deleting it, use DisableKey.

     If you schedule deletion of a KMS key from a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">custom key store, when the waiting period
  expires, ScheduleKeyDeletion deletes the KMS key from KMS. Then KMS makes a best
  effort to delete the key material from the associated CloudHSM cluster. However, you might need
  to manually <a href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-orphaned-key">delete the orphaned key
    material from the cluster and its backups.
     You can schedule the deletion of a multi-Region primary key and its replica keys at any
  time. However, KMS will not delete a multi-Region primary key with existing replica keys. If
  you schedule the deletion of a primary key with replicas, its key state changes to
    PendingReplicaDeletion and it cannot be replicated or used in cryptographic
  operations. This status can continue indefinitely. When the last of its replicas keys is
  deleted (not just scheduled), the key state of the primary key changes to
    PendingDeletion and its waiting period (PendingWindowInDays)
  begins. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-delete.html">Deleting multi-Region keys in the Key Management Service Developer Guide.
     For more information about scheduling a KMS key for deletion, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/deleting-keys.html">Deleting KMS keys in the
  Key Management Service Developer Guide.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.



        Required permissions: kms:ScheduleKeyDeletion (key policy)

        Related operations




              CancelKeyDeletion




              DisableKey
```

### `sign(input:completion:)`

Creates a <a href="https:​//en.wikipedia.org/wiki/Digital_signature">digital
signature for a message or message digest by using the private key in an asymmetric KMS key. To verify the signature, use the Verify operation, or use the public
key in the same asymmetric KMS key outside of KMS. For information about symmetric and asymmetric KMS keys, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric KMS keys in the Key Management Service Developer Guide.
Digital signatures are generated and verified by using asymmetric key pair, such as an RSA
or ECC pair that is represented by an asymmetric KMS key. The key owner (or
an authorized user) uses their private key to sign a message. Anyone with the public key can
verify that the message was signed with that particular private key and that the message
hasn't changed since it was signed.
To use the Sign operation, provide the following information:​

``` swift
public func sign(input: SignInput, completion: @escaping (ClientRuntime.SdkResult<SignOutputResponse, SignOutputError>) -> Void)
```

``` 
           Use the KeyId parameter to identify an asymmetric KMS key with a
        KeyUsage value of SIGN_VERIFY. To get the
        KeyUsage value of a KMS key, use the DescribeKey operation.
      The caller must have kms:Sign permission on the KMS key.


           Use the Message parameter to specify the message or message digest to
      sign. You can submit messages of up to 4096 bytes. To sign a larger message, generate a
      hash digest of the message, and then provide the hash digest in the Message
      parameter. To indicate whether the message is a full message or a digest, use the
        MessageType parameter.


           Choose a signing algorithm that is compatible with the KMS key.



        When signing a message, be sure to record the KMS key and the signing algorithm. This
    information is required to verify the signature.

     To verify the signature that this operation generates, use the Verify
  operation. Or use the GetPublicKey operation to download the public key and
  then use the public key to verify the signature outside of KMS.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Sign (key policy)

        Related operations: Verify
```

### `tagResource(input:completion:)`

Adds or edits tags on a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer managed key.

``` swift
public func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

``` 
        Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using ABAC in KMS in the Key Management Service Developer Guide.

     Each tag consists of a tag key and a tag value, both of which are case-sensitive strings.
  The tag value can be an empty (null) string. To add a tag, specify a new tag key and a tag
  value. To edit a tag, specify an existing tag key and a new tag value.
     You can use this operation to tag a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer managed key, but you cannot
  tag an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk">Amazon Web Services managed key, an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-owned-cmk">Amazon Web Services owned key, a <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#keystore-concept">custom key store, or
  an <a href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#alias-concept">alias.
     You can also add tags to a KMS key while creating it (CreateKey) or replicating it (ReplicateKey).
     For information about using tags in KMS, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging keys. For general information about
  tags, including the format and syntax, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging Amazon Web Services resources in the Amazon
    Web Services General Reference.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: No.  You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:TagResource (key policy)

        Related operations




              CreateKey




              ListResourceTags




              ReplicateKey




              UntagResource
```

### `untagResource(input:completion:)`

Deletes tags from a <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk">customer managed key. To delete a tag,
specify the tag key and the KMS key.

``` swift
public func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

``` 
        Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using ABAC in KMS in the Key Management Service Developer Guide.

     When it succeeds, the UntagResource operation doesn't return any output.
  Also, if the specified tag key isn't found on the KMS key, it doesn't throw an exception or return
  a response. To confirm that the operation worked, use the ListResourceTags operation.

     For information about using tags in KMS, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/tagging-keys.html">Tagging keys. For general information about
  tags, including the format and syntax, see <a href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging Amazon Web Services resources in the Amazon
    Web Services General Reference.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: No.  You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UntagResource (key policy)

        Related operations




              CreateKey




              ListResourceTags




              ReplicateKey




              TagResource
```

### `updateAlias(input:completion:)`

Associates an existing KMS alias with a different KMS key. Each alias
is associated with only one KMS key at a time, although a KMS key can have multiple aliases. The alias
and the KMS key must be in the same Amazon Web Services account and Region.

``` swift
public func updateAlias(input: UpdateAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateAliasOutputResponse, UpdateAliasOutputError>) -> Void)
```

``` 
        Adding, deleting, or updating an alias can allow or deny permission to the KMS key. For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/abac.html">Using ABAC in KMS in the Key Management Service Developer Guide.

     The current and new KMS key must be the same type (both symmetric or both asymmetric), and
  they must have the same key usage (ENCRYPT_DECRYPT or SIGN_VERIFY).
  This restriction prevents errors in code that uses aliases. If you must assign an alias to a
  different type of KMS key, use DeleteAlias to delete the old alias and CreateAlias to create a new alias.
     You cannot use UpdateAlias to change an alias name. To change an alias name,
  use DeleteAlias to delete the old alias and CreateAlias to
  create a new alias.
     Because an alias is not a property of a KMS key, you can create, update, and delete the
  aliases of a KMS key without affecting the KMS key. Also, aliases do not appear in the response from
  the DescribeKey operation. To get the aliases of all KMS keys in the account,
  use the ListAliases operation.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: No. You cannot perform this operation on a KMS key in a different Amazon Web Services account.

        Required permissions




              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateAlias on the alias (IAM policy).



              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateAlias on the current KMS key (key policy).



              <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateAlias on the new KMS key (key policy).


     For details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-alias.html#alias-access">Controlling access to aliases in the Key Management Service Developer Guide.

        Related operations:




              CreateAlias




              DeleteAlias




              ListAliases
```

### `updateCustomKeyStore(input:completion:)`

Changes the properties of a custom key store. Use the CustomKeyStoreId
parameter to identify the custom key store you want to edit. Use the remaining parameters to
change the properties of the custom key store.
You can only update a custom key store that is disconnected. To disconnect the custom key
store, use DisconnectCustomKeyStore. To reconnect the custom key store after
the update completes, use ConnectCustomKeyStore. To find the connection
state of a custom key store, use the DescribeCustomKeyStores
operation.
Use the parameters of UpdateCustomKeyStore to edit your keystore
settings.

``` swift
public func updateCustomKeyStore(input: UpdateCustomKeyStoreInput, completion: @escaping (ClientRuntime.SdkResult<UpdateCustomKeyStoreOutputResponse, UpdateCustomKeyStoreOutputError>) -> Void)
```

``` 
           Use the NewCustomKeyStoreName parameter to change the
      friendly name of the custom key store to the value that you specify.



           Use the KeyStorePassword parameter tell KMS the
      current password of the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-store-concepts.html#concept-kmsuser">
                 kmsuser crypto
        user (CU) in the associated CloudHSM cluster. You can use this parameter to <a href="https://docs.aws.amazon.com/kms/latest/developerguide/fix-keystore.html#fix-keystore-password">fix
        connection failures that occur when KMS cannot log into the associated cluster
      because the kmsuser password has changed. This value does not change the
      password in the CloudHSM cluster.



           Use the CloudHsmClusterId parameter to associate the
      custom key store with a different, but related, CloudHSM cluster. You can use this parameter
      to repair a custom key store if its CloudHSM cluster becomes corrupted or is deleted, or when
      you need to create or restore a cluster from a backup.


     If the operation succeeds, it returns a JSON object with no
```

properties.
This operation is part of the <a href="https://docs.aws.amazon.com/kms/latest/developerguide/custom-key-store-overview.html">Custom Key Store feature feature in KMS, which
combines the convenience and extensive integration of KMS with the isolation and control of a
single-tenant key store.

``` 
        Cross-account use: No. You cannot perform this operation on a custom key store in a different Amazon Web Services account.

        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateCustomKeyStore (IAM policy)

        Related operations:




              ConnectCustomKeyStore




              CreateCustomKeyStore




              DeleteCustomKeyStore




              DescribeCustomKeyStores




              DisconnectCustomKeyStore
```

### `updateKeyDescription(input:completion:)`

Updates the description of a KMS key. To see the description of a KMS key,
use DescribeKey.
The KMS key that you use for this operation must be in a compatible key state. For
details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state:​ Effect on your KMS key in the Key Management Service Developer Guide.

``` swift
public func updateKeyDescription(input: UpdateKeyDescriptionInput, completion: @escaping (ClientRuntime.SdkResult<UpdateKeyDescriptionOutputResponse, UpdateKeyDescriptionOutputError>) -> Void)
```

``` 
        Cross-account use: No.  You cannot perform this operation on a KMS key in a different Amazon Web Services account.


        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:UpdateKeyDescription (key policy)

        Related operations




              CreateKey




              DescribeKey
```

### `updatePrimaryRegion(input:completion:)`

Changes the primary key of a multi-Region key.
This operation changes the replica key in the specified Region to a primary key and
changes the former primary key to a replica key. For example, suppose you have a primary key
in us-east-1 and a replica key in eu-west-2. If you run
UpdatePrimaryRegion with a PrimaryRegion value of
eu-west-2, the primary key is now the key in eu-west-2, and the
key in us-east-1 becomes a replica key. For details, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-manage.html#multi-region-update">Updating the primary Region in the Key Management Service Developer Guide.
This operation supports multi-Region keys, an KMS feature that lets you create multiple
interoperable KMS keys in different Amazon Web Services Regions. Because these KMS keys have the same key ID, key
material, and other metadata, you can use them interchangeably to encrypt data in one Amazon Web Services Region and decrypt
it in a different Amazon Web Services Region without re-encrypting the data or making a cross-Region call. For more information about multi-Region keys, see <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/multi-region-keys-overview.html">Using multi-Region keys in the Key Management Service Developer Guide.
The primary key of a multi-Region key is the source for properties
that are always shared by primary and replica keys, including the key material, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-id">key ID, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-spec">key spec, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-usage">key usage, <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-origin">key material
origin, and <a href="https:​//docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html">automatic
key rotation. It's the only key that can be replicated. You cannot <a href="https:​//docs.aws.amazon.com/kms/latest/APIReference/API_ScheduleKeyDeletion.html">delete the primary
key until all replica keys are deleted.
The key ID and primary Region that you specify uniquely identify the replica key that will
become the primary key. The primary Region must already have a replica key. This operation
does not create a KMS key in the specified Region. To find the replica keys, use the DescribeKey operation on the primary key or any replica key. To create a replica
key, use the ReplicateKey operation.
You can run this operation while using the affected multi-Region keys in cryptographic
operations. This operation should not delay, interrupt, or cause failures in cryptographic
operations.
Even after this operation completes, the process of updating the primary Region might
still be in progress for a few more seconds. Operations such as DescribeKey might
display both the old and new primary keys as replicas. The old and new primary keys have a
transient key state of Updating. The original key state is restored when the
update is complete. While the key state is Updating, you can use the keys in
cryptographic operations, but you cannot replicate the new primary key or perform certain
management operations, such as enabling or disabling these keys. For details about the
Updating key state, see <a href="kms/latest/developerguide/key-state.html">Key state:​
Effect on your KMS key in the Key Management Service Developer Guide.
This operation does not return any output. To verify that primary key is changed, use the
DescribeKey operation.

``` swift
public func updatePrimaryRegion(input: UpdatePrimaryRegionInput, completion: @escaping (ClientRuntime.SdkResult<UpdatePrimaryRegionOutputResponse, UpdatePrimaryRegionOutputError>) -> Void)
```

``` 
        Cross-account use: No. You cannot use this operation in a
  different Amazon Web Services account.

        Required permissions:



              kms:UpdatePrimaryRegion on the current primary key (in the primary key's
      Region). Include this permission primary key's key policy.



              kms:UpdatePrimaryRegion on the current replica key (in the replica key's
      Region). Include this permission in the replica key's key policy.



        Related operations




              CreateKey




              ReplicateKey
```

### `verify(input:completion:)`

Verifies a digital signature that was generated by the Sign operation.

``` swift
public func verify(input: VerifyInput, completion: @escaping (ClientRuntime.SdkResult<VerifyOutputResponse, VerifyOutputError>) -> Void)
```

``` 
     Verification confirms that an authorized user signed the message with the specified KMS key
  and signing algorithm, and the message hasn't changed since it was signed. If the signature is
  verified, the value of the SignatureValid field in the response is
    True. If the signature verification fails, the Verify operation
  fails with an KMSInvalidSignatureException exception.
     A digital signature is generated by using the private key in an asymmetric KMS key. The
  signature is verified by using the public key in the same asymmetric KMS key.
  For information about symmetric and asymmetric KMS keys, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using Symmetric and Asymmetric KMS keys in the Key Management Service Developer Guide.
     To verify a digital signature, you can use the Verify operation. Specify the
  same asymmetric KMS key, message, and signing algorithm that were used to produce the
  signature.
     You can also verify the digital signature by using the public key of the KMS key outside of
  KMS. Use the GetPublicKey operation to download the public key in the
  asymmetric KMS key and then use the public key to verify the signature outside of KMS. The
  advantage of using the Verify operation is that it is performed within KMS. As
  a result, it's easy to call, the operation is performed within the FIPS boundary, it is logged
  in CloudTrail, and you can use key policy and IAM policy to determine who is authorized to use
  the KMS key to verify signatures.
     The KMS key that you use for this operation must be in a compatible key state. For
```

details, see <a href="https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html">Key state: Effect on your KMS key in the Key Management Service Developer Guide.

``` 
        Cross-account use: Yes. To perform this operation with a KMS key in a different Amazon Web Services account, specify
```

the key ARN or alias ARN in the value of the KeyId parameter.

``` 
        Required permissions: <a href="https://docs.aws.amazon.com/kms/latest/developerguide/kms-api-permissions-reference.html">kms:Verify (key policy)

        Related operations: Sign
```
