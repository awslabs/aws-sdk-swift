# LexRuntimeV2Client

``` swift
public class LexRuntimeV2Client 
```

## Inheritance

[`LexRuntimeV2ClientProtocol`](/aws-sdk-swift/reference/0.x/AWSLexRuntimeV2/LexRuntimeV2ClientProtocol)

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

### `deleteSession(input:completion:)`

Removes session information for a specified bot, alias, and user ID.
You can use this operation to restart a conversation with a bot.
When you remove a session, the entire history of the session is removed
so that you can start again.
You don't need to delete a session. Sessions have a time limit and
will expire. Set the session time limit when you create the bot. The
default is 5 minutes, but you can specify anything between 1 minute and
24 hours.
If you specify a bot or alias ID that doesn't exist, you receive a
BadRequestException.

``` swift
public func deleteSession(input: DeleteSessionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSessionOutputResponse, DeleteSessionOutputError>) -> Void)
```

``` 
     If the locale doesn't exist in the bot, or if the locale hasn't been
     enables for the alias, you receive a
     BadRequestException.
```

### `getSession(input:completion:)`

Returns session information for a specified bot, alias, and
user.
For example, you can use this operation to retrieve session
information for a user that has left a long-running session in
use.
If the bot, alias, or session identifier doesn't exist, Amazon Lex V2
returns a BadRequestException. If the locale doesn't exist
or is not enabled for the alias, you receive a
BadRequestException.

``` swift
public func getSession(input: GetSessionInput, completion: @escaping (ClientRuntime.SdkResult<GetSessionOutputResponse, GetSessionOutputError>) -> Void)
```

### `putSession(input:completion:)`

Creates a new session or modifies an existing session with an Amazon Lex V2
bot. Use this operation to enable your application to set the state of
the bot.

``` swift
public func putSession(input: PutSessionInput, completion: @escaping (ClientRuntime.SdkResult<PutSessionOutputResponse, PutSessionOutputError>) -> Void)
```

### `recognizeText(input:completion:)`

Sends user input to Amazon Lex V2. Client applications use this API to send
requests to Amazon Lex V2 at runtime. Amazon Lex V2 then interprets the user input
using the machine learning model that it build for the bot.
In response, Amazon Lex V2 returns the next message to convey to the user
and an optional response card to display.

``` swift
public func recognizeText(input: RecognizeTextInput, completion: @escaping (ClientRuntime.SdkResult<RecognizeTextOutputResponse, RecognizeTextOutputError>) -> Void)
```

### `recognizeUtterance(input:completion:)`

Sends user input to Amazon Lex V2. You can send text or speech. Clients use
this API to send text and audio requests to Amazon Lex V2 at runtime. Amazon Lex V2
interprets the user input using the machine learning model built for
the bot.
The following request fields must be compressed with gzip and then
base64 encoded before you send them to Amazon Lex V2.

``` swift
public func recognizeUtterance(input: RecognizeUtteranceInput, completion: @escaping (ClientRuntime.SdkResult<RecognizeUtteranceOutputResponse, RecognizeUtteranceOutputError>) -> Void)
```

``` 
           requestAttributes


           sessionState


     The following response fields are compressed using gzip and then
     base64 encoded by Amazon Lex V2. Before you can use these fields, you must
     decode and decompress them.


           inputTranscript


           interpretations


           messages


           requestAttributes


           sessionState


     The example contains a Java application that compresses and encodes
     a Java object to send to Amazon Lex V2, and a second that decodes and
     decompresses a response from Amazon Lex V2.
```

### `startConversation(input:completion:)`

Starts an HTTP/2 bidirectional event stream that enables you to send
audio, text, or DTMF input in real time. After your application starts
a conversation, users send input to Amazon Lex V2 as a stream of events. Amazon Lex V2
processes the incoming events and responds with streaming text or audio
events.

``` swift
public func startConversation(input: StartConversationInput, completion: @escaping (ClientRuntime.SdkResult<StartConversationOutputResponse, StartConversationOutputError>) -> Void)
```

``` 
     Audio input must be in the following format: audio/lpcm
        sample-rate=8000 sample-size-bits=16 channel-count=1;
        is-big-endian=false.
     The StartConversation operation is supported only in
     the following SDKs:



              <a href="https://docs.aws.amazon.com/goto/SdkForCpp/runtime.lex.v2-2020-08-07/StartConversation">AWS SDK for C++




              <a href="https://docs.aws.amazon.com/goto/SdkForJavaV2/runtime.lex.v2-2020-08-07/StartConversation">AWS SDK for Java V2




              <a href="https://docs.aws.amazon.com/goto/SdkForRubyV3/runtime.lex.v2-2020-08-07/StartConversation">AWS SDK for Ruby V3
```
