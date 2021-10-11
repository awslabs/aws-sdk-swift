# LexRuntimeClient

``` swift
public class LexRuntimeClient 
```

## Inheritance

[`LexRuntimeClientProtocol`](/aws-sdk-swift/reference/0.x/AWSLexRuntimeService/LexRuntimeClientProtocol)

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

``` swift
public func deleteSession(input: DeleteSessionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSessionOutputResponse, DeleteSessionOutputError>) -> Void)
```

### `getSession(input:completion:)`

Returns session information for a specified bot, alias, and user
ID.

``` swift
public func getSession(input: GetSessionInput, completion: @escaping (ClientRuntime.SdkResult<GetSessionOutputResponse, GetSessionOutputError>) -> Void)
```

### `postContent(input:completion:)`

Sends user input (text or speech) to Amazon Lex. Clients use this API to
send text and audio requests to Amazon Lex at runtime. Amazon Lex interprets the
user input using the machine learning model that it built for the bot.
The PostContent operation supports audio input at 8kHz
and 16kHz. You can use 8kHz audio to achieve higher speech recognition
accuracy in telephone audio applications.
In response, Amazon Lex returns the next message to convey to the user.
Consider the following example messages:​

``` swift
public func postContent(input: PostContentInput, completion: @escaping (ClientRuntime.SdkResult<PostContentOutputResponse, PostContentOutputError>) -> Void)
```

``` 
           For a user input "I would like a pizza," Amazon Lex might return a
     response with a message eliciting slot data (for example,
       PizzaSize): "What size pizza would you like?".


           After the user provides all of the pizza order information, Amazon Lex
     might return a response with a message to get user confirmation:
     "Order the pizza?".


           After the user replies "Yes" to the confirmation prompt, Amazon Lex
     might return a conclusion statement: "Thank you, your cheese pizza has
     been ordered.".


     Not all Amazon Lex messages require a response from the user. For example,
 conclusion statements do not require a response. Some messages require
 only a yes or no response. In addition to the message, Amazon Lex
 provides additional context about the message in the response that you can
 use to enhance client behavior, such as displaying the appropriate client
 user interface. Consider the following examples:


           If the message is to elicit slot data, Amazon Lex returns the
     following context information:



                   x-amz-lex-dialog-state header set to
           ElicitSlot




                   x-amz-lex-intent-name header set to the intent name
         in the current context



                   x-amz-lex-slot-to-elicit header set to the slot name
         for which the message is eliciting information




                   x-amz-lex-slots header set to a map of slots
         configured for the intent with their current values




           If the message is a confirmation prompt, the
       x-amz-lex-dialog-state header is set to
       Confirmation and the
       x-amz-lex-slot-to-elicit header is omitted.


           If the message is a clarification prompt configured for the
     intent, indicating that the user intent is not understood, the
       x-amz-dialog-state header is set to
       ElicitIntent and the x-amz-slot-to-elicit
     header is omitted.


     In addition, Amazon Lex also returns your application-specific
   sessionAttributes. For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing
   Conversation Context.
```

### `postText(input:completion:)`

Sends user input to Amazon Lex. Client applications can use this API to
send requests to Amazon Lex at runtime. Amazon Lex then interprets the user input
using the machine learning model it built for the bot.
In response, Amazon Lex returns the next message to convey to
the user an optional responseCard to display. Consider the
following example messages:​

``` swift
public func postText(input: PostTextInput, completion: @escaping (ClientRuntime.SdkResult<PostTextOutputResponse, PostTextOutputError>) -> Void)
```

``` 
            For a user input "I would like a pizza", Amazon Lex might return a
      response with a message eliciting slot data (for example, PizzaSize):
      "What size pizza would you like?"


            After the user provides all of the pizza order information,
      Amazon Lex might return a response with a message to obtain user
      confirmation "Proceed with the pizza order?".


            After the user replies to a confirmation prompt with a "yes",
      Amazon Lex might return a conclusion statement: "Thank you, your cheese
      pizza has been ordered.".



      Not all Amazon Lex messages require a user response. For example, a
  conclusion statement does not require a response. Some messages require
  only a "yes" or "no" user response. In addition to the
    message, Amazon Lex provides additional context about the
  message in the response that you might use to enhance client behavior, for
  example, to display the appropriate client user interface. These are the
    slotToElicit, dialogState,
    intentName, and slots fields in the response.
  Consider the following examples:



           If the message is to elicit slot data, Amazon Lex returns the
      following context information:



                    dialogState set to ElicitSlot



                    intentName set to the intent name in the current
          context



                    slotToElicit set to the slot name for which the
            message is eliciting information



                    slots set to a map of slots, configured for the
          intent, with currently known values




            If the message is a confirmation prompt, the
        dialogState is set to ConfirmIntent and
        SlotToElicit is set to null.


           If the message is a clarification prompt (configured for the
      intent) that indicates that user intent is not understood, the
        dialogState is set to ElicitIntent and
        slotToElicit is set to null.



      In addition, Amazon Lex also returns your application-specific
    sessionAttributes. For more information, see <a href="https://docs.aws.amazon.com/lex/latest/dg/context-mgmt.html">Managing
    Conversation Context.
```

### `putSession(input:completion:)`

Creates a new session or modifies an existing session with an Amazon Lex
bot. Use this operation to enable your application to set the state of the
bot.
For more information, see <a href="https:​//docs.aws.amazon.com/lex/latest/dg/how-session-api.html">Managing
Sessions.

``` swift
public func putSession(input: PutSessionInput, completion: @escaping (ClientRuntime.SdkResult<PutSessionOutputResponse, PutSessionOutputError>) -> Void)
```
