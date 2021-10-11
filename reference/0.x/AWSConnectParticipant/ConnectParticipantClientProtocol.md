# ConnectParticipantClientProtocol

Amazon Connect is a cloud-based contact center solution that makes it easy to set up and manage
a customer contact center and provide reliable customer engagement at any scale.
Amazon Connect enables customer contacts through voice or chat.

``` swift
public protocol ConnectParticipantClientProtocol 
```

``` 
    The APIs described here are used by chat participants, such as agents and
        customers.
```

## Requirements

### completeAttachmentUpload(input:​completion:​)

Allows you to confirm that the attachment has been uploaded using the pre-signed URL
provided in StartAttachmentUpload API.

``` swift
func completeAttachmentUpload(input: CompleteAttachmentUploadInput, completion: @escaping (ClientRuntime.SdkResult<CompleteAttachmentUploadOutputResponse, CompleteAttachmentUploadOutputError>) -> Void)
```

### createParticipantConnection(input:​completion:​)

Creates the participant's connection. Note that ParticipantToken is used for invoking
this API instead of ConnectionToken.
The participant token is valid for the lifetime of the participant – until they are
part of a contact.
The response URL for WEBSOCKET Type has a connect expiry timeout of 100s.
Clients must manually connect to the returned websocket URL and subscribe to the desired
topic.
For chat, you need to publish the following on the established websocket
connection:​

``` swift
func createParticipantConnection(input: CreateParticipantConnectionInput, completion: @escaping (ClientRuntime.SdkResult<CreateParticipantConnectionOutputResponse, CreateParticipantConnectionOutputError>) -> Void)
```

``` 
        {"topic":"aws/subscribe","content":{"topics":["aws/chat"]}}


    Upon websocket URL expiry, as specified in the response ConnectionExpiry parameter,
        clients need to call this API again to obtain a new websocket URL and perform the same
        steps as before.


        The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4
                authentication.
```

### disconnectParticipant(input:​completion:​)

Disconnects a participant. Note that ConnectionToken is used for invoking this API
instead of ParticipantToken.
The Amazon Connect Participant Service APIs do not use <a href="https:​//docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4
authentication.

``` swift
func disconnectParticipant(input: DisconnectParticipantInput, completion: @escaping (ClientRuntime.SdkResult<DisconnectParticipantOutputResponse, DisconnectParticipantOutputError>) -> Void)
```

### getAttachment(input:​completion:​)

Provides a pre-signed URL for download of a completed attachment. This is an
asynchronous API for use with active contacts.

``` swift
func getAttachment(input: GetAttachmentInput, completion: @escaping (ClientRuntime.SdkResult<GetAttachmentOutputResponse, GetAttachmentOutputError>) -> Void)
```

### getTranscript(input:​completion:​)

Retrieves a transcript of the session, including details about any attachments. Note
that ConnectionToken is used for invoking this API instead of ParticipantToken.
The Amazon Connect Participant Service APIs do not use <a href="https:​//docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4
authentication.

``` swift
func getTranscript(input: GetTranscriptInput, completion: @escaping (ClientRuntime.SdkResult<GetTranscriptOutputResponse, GetTranscriptOutputError>) -> Void)
```

### sendEvent(input:​completion:​)

Sends an event. Note that ConnectionToken is used for invoking this API instead of
ParticipantToken.
The Amazon Connect Participant Service APIs do not use <a href="https:​//docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4
authentication.

``` swift
func sendEvent(input: SendEventInput, completion: @escaping (ClientRuntime.SdkResult<SendEventOutputResponse, SendEventOutputError>) -> Void)
```

### sendMessage(input:​completion:​)

Sends a message. Note that ConnectionToken is used for invoking this API instead of
ParticipantToken.

``` swift
func sendMessage(input: SendMessageInput, completion: @escaping (ClientRuntime.SdkResult<SendMessageOutputResponse, SendMessageOutputError>) -> Void)
```

``` 
        The Amazon Connect Participant Service APIs do not use <a href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature Version 4
                authentication.
```

### startAttachmentUpload(input:​completion:​)

Provides a pre-signed Amazon S3 URL in response for uploading the file directly to
S3.

``` swift
func startAttachmentUpload(input: StartAttachmentUploadInput, completion: @escaping (ClientRuntime.SdkResult<StartAttachmentUploadOutputResponse, StartAttachmentUploadOutputError>) -> Void)
```
