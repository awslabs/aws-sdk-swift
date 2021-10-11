# Types

  - [LexRuntimeClient](/aws-sdk-swift/reference/0.x/AWSLexRuntimeService/LexRuntimeClient)
  - [LexRuntimeClient.LexRuntimeClientConfiguration](/aws-sdk-swift/reference/0.x/AWSLexRuntimeService/LexRuntimeClient_LexRuntimeClientConfiguration)
  - [LexRuntimeClientTypes](/aws-sdk-swift/reference/0.x/AWSLexRuntimeService/LexRuntimeClientTypes)
  - [LexRuntimeClientLogHandlerFactory](/aws-sdk-swift/reference/0.x/AWSLexRuntimeService/LexRuntimeClientLogHandlerFactory)

# Protocols

  - [LexRuntimeClientProtocol](/aws-sdk-swift/reference/0.x/AWSLexRuntimeService/LexRuntimeClientProtocol):
    Amazon Lex provides both build and runtime endpoints. Each endpoint
    provides a set of operations (API). Your conversational bot uses the
    runtime API to understand user utterances (user input text or voice). For
    example, suppose a user says "I want pizza", your bot sends this input to
    Amazon Lex using the runtime API. Amazon Lex recognizes that the user
    request is for the OrderPizza intent (one of the intents defined in the
    bot). Then Amazon Lex engages in user conversation on behalf of the bot to
    elicit required information (slot values, such as pizza size and crust
    type), and then performs fulfillment activity (that you configured when
    you created the bot). You use the build-time API to create and manage your
    Amazon Lex bot. For a list of build-time operations, see the build-time
    API, .
