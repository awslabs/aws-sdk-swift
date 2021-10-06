# Types

  - [PollyClient](/PollyClient)
  - [PollyClient.PollyClientConfiguration](/PollyClient_PollyClientConfiguration)
  - [PollyClientTypes](/PollyClientTypes)
  - [DeleteLexiconOutputError](/DeleteLexiconOutputError)
  - [DescribeVoicesOutputError](/DescribeVoicesOutputError)
  - [PollyClientTypes.Engine](/PollyClientTypes_Engine)
  - [PollyClientTypes.Gender](/PollyClientTypes_Gender)
  - [GetLexiconOutputError](/GetLexiconOutputError)
  - [GetSpeechSynthesisTaskOutputError](/GetSpeechSynthesisTaskOutputError)
  - [PollyClientTypes.LanguageCode](/PollyClientTypes_LanguageCode)
  - [ListLexiconsOutputError](/ListLexiconsOutputError)
  - [ListSpeechSynthesisTasksOutputError](/ListSpeechSynthesisTasksOutputError)
  - [PollyClientTypes.OutputFormat](/PollyClientTypes_OutputFormat)
  - [PutLexiconOutputError](/PutLexiconOutputError)
  - [PollyClientTypes.SpeechMarkType](/PollyClientTypes_SpeechMarkType)
  - [StartSpeechSynthesisTaskOutputError](/StartSpeechSynthesisTaskOutputError)
  - [SynthesizeSpeechOutputError](/SynthesizeSpeechOutputError)
  - [PollyClientTypes.TaskStatus](/PollyClientTypes_TaskStatus)
  - [PollyClientTypes.TextType](/PollyClientTypes_TextType)
  - [PollyClientTypes.VoiceId](/PollyClientTypes_VoiceId)
  - [PollyClientLogHandlerFactory](/PollyClientLogHandlerFactory)
  - [DeleteLexiconInputHeadersMiddleware](/DeleteLexiconInputHeadersMiddleware)
  - [DeleteLexiconInputQueryItemMiddleware](/DeleteLexiconInputQueryItemMiddleware)
  - [DeleteLexiconInputURLPathMiddleware](/DeleteLexiconInputURLPathMiddleware)
  - [DeleteLexiconInput](/DeleteLexiconInput)
  - [DeleteLexiconOutputResponse](/DeleteLexiconOutputResponse)
  - [DescribeVoicesInputHeadersMiddleware](/DescribeVoicesInputHeadersMiddleware)
  - [DescribeVoicesInputQueryItemMiddleware](/DescribeVoicesInputQueryItemMiddleware)
  - [DescribeVoicesInputURLPathMiddleware](/DescribeVoicesInputURLPathMiddleware)
  - [DescribeVoicesInput](/DescribeVoicesInput)
  - [DescribeVoicesOutputResponse](/DescribeVoicesOutputResponse)
  - [EngineNotSupportedException](/EngineNotSupportedException):
    This engine is not compatible with the voice that you have designated.
    Choose a new voice that is compatible with the engine or change the engine
    and restart the operation.
  - [GetLexiconInputHeadersMiddleware](/GetLexiconInputHeadersMiddleware)
  - [GetLexiconInputQueryItemMiddleware](/GetLexiconInputQueryItemMiddleware)
  - [GetLexiconInputURLPathMiddleware](/GetLexiconInputURLPathMiddleware)
  - [GetLexiconInput](/GetLexiconInput)
  - [GetLexiconOutputResponse](/GetLexiconOutputResponse)
  - [GetSpeechSynthesisTaskInputHeadersMiddleware](/GetSpeechSynthesisTaskInputHeadersMiddleware)
  - [GetSpeechSynthesisTaskInputQueryItemMiddleware](/GetSpeechSynthesisTaskInputQueryItemMiddleware)
  - [GetSpeechSynthesisTaskInputURLPathMiddleware](/GetSpeechSynthesisTaskInputURLPathMiddleware)
  - [GetSpeechSynthesisTaskInput](/GetSpeechSynthesisTaskInput)
  - [GetSpeechSynthesisTaskOutputResponse](/GetSpeechSynthesisTaskOutputResponse)
  - [InvalidLexiconException](/InvalidLexiconException):
    Amazon Polly can't find the specified lexicon. Verify that the lexicon's
    name is spelled correctly, and then try again.
  - [InvalidNextTokenException](/InvalidNextTokenException):
    The NextToken is invalid. Verify that it's spelled correctly, and
    then try again.
  - [InvalidS3BucketException](/InvalidS3BucketException):
    The provided Amazon S3 bucket name is invalid. Please check your input
    with S3 bucket naming requirements and try again.
  - [InvalidS3KeyException](/InvalidS3KeyException):
    The provided Amazon S3 key prefix is invalid. Please provide a valid
    S3 object key name.
  - [InvalidSampleRateException](/InvalidSampleRateException):
    The specified sample rate is not valid.
  - [InvalidSnsTopicArnException](/InvalidSnsTopicArnException):
    The provided SNS topic ARN is invalid. Please provide a valid SNS
    topic ARN and try again.
  - [InvalidSsmlException](/InvalidSsmlException):
    The SSML you provided is invalid. Verify the SSML syntax, spelling
    of tags and values, and then try again.
  - [InvalidTaskIdException](/InvalidTaskIdException):
    The provided Task ID is not valid. Please provide a valid Task ID and
    try again.
  - [LanguageNotSupportedException](/LanguageNotSupportedException):
    The language specified is not currently supported by Amazon Polly in this
    capacity.
  - [PollyClientTypes.Lexicon](/PollyClientTypes_Lexicon):
    Provides lexicon name and lexicon content in string format. For
    more information, see <a href="https://www.w3.org/TR/pronunciation-lexicon/">Pronunciation Lexicon
    Specification (PLS) Version 1.0.
  - [PollyClientTypes.LexiconAttributes](/PollyClientTypes_LexiconAttributes):
    Contains metadata describing the lexicon such as the number of
    lexemes, language code, and so on. For more information, see <a href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing Lexicons.
  - [PollyClientTypes.LexiconDescription](/PollyClientTypes_LexiconDescription):
    Describes the content of the lexicon.
  - [LexiconNotFoundException](/LexiconNotFoundException):
    Amazon Polly can't find the specified lexicon. This could be caused by a
    lexicon that is missing, its name is misspelled or specifying a lexicon
    that is in a different region.
    Verify that the lexicon exists, is in the region (see ListLexicons) and that you spelled its name is spelled
    correctly. Then try again.
  - [LexiconSizeExceededException](/LexiconSizeExceededException):
    The maximum size of the specified lexicon would be exceeded by this
    operation.
  - [ListLexiconsInputHeadersMiddleware](/ListLexiconsInputHeadersMiddleware)
  - [ListLexiconsInputQueryItemMiddleware](/ListLexiconsInputQueryItemMiddleware)
  - [ListLexiconsInputURLPathMiddleware](/ListLexiconsInputURLPathMiddleware)
  - [ListLexiconsInput](/ListLexiconsInput)
  - [ListLexiconsOutputResponse](/ListLexiconsOutputResponse)
  - [ListSpeechSynthesisTasksInputHeadersMiddleware](/ListSpeechSynthesisTasksInputHeadersMiddleware)
  - [ListSpeechSynthesisTasksInputQueryItemMiddleware](/ListSpeechSynthesisTasksInputQueryItemMiddleware)
  - [ListSpeechSynthesisTasksInputURLPathMiddleware](/ListSpeechSynthesisTasksInputURLPathMiddleware)
  - [ListSpeechSynthesisTasksInput](/ListSpeechSynthesisTasksInput)
  - [ListSpeechSynthesisTasksOutputResponse](/ListSpeechSynthesisTasksOutputResponse)
  - [MarksNotSupportedForFormatException](/MarksNotSupportedForFormatException):
    Speech marks are not supported for the OutputFormat
    selected. Speech marks are only available for content in json
    format.
  - [MaxLexemeLengthExceededException](/MaxLexemeLengthExceededException):
    The maximum size of the lexeme would be exceeded by this
    operation.
  - [MaxLexiconsNumberExceededException](/MaxLexiconsNumberExceededException):
    The maximum number of lexicons would be exceeded by this
    operation.
  - [PutLexiconInputBodyMiddleware](/PutLexiconInputBodyMiddleware)
  - [PutLexiconInputHeadersMiddleware](/PutLexiconInputHeadersMiddleware)
  - [PutLexiconInputQueryItemMiddleware](/PutLexiconInputQueryItemMiddleware)
  - [PutLexiconInputURLPathMiddleware](/PutLexiconInputURLPathMiddleware)
  - [PutLexiconInput](/PutLexiconInput)
  - [PutLexiconOutputResponse](/PutLexiconOutputResponse)
  - [ServiceFailureException](/ServiceFailureException):
    An unknown condition has caused a service failure.
  - [SsmlMarksNotSupportedForTextTypeException](/SsmlMarksNotSupportedForTextTypeException):
    SSML speech marks are not supported for plain text-type
    input.
  - [StartSpeechSynthesisTaskInputBodyMiddleware](/StartSpeechSynthesisTaskInputBodyMiddleware)
  - [StartSpeechSynthesisTaskInputHeadersMiddleware](/StartSpeechSynthesisTaskInputHeadersMiddleware)
  - [StartSpeechSynthesisTaskInputQueryItemMiddleware](/StartSpeechSynthesisTaskInputQueryItemMiddleware)
  - [StartSpeechSynthesisTaskInputURLPathMiddleware](/StartSpeechSynthesisTaskInputURLPathMiddleware)
  - [StartSpeechSynthesisTaskInput](/StartSpeechSynthesisTaskInput)
  - [StartSpeechSynthesisTaskOutputResponse](/StartSpeechSynthesisTaskOutputResponse)
  - [PollyClientTypes.SynthesisTask](/PollyClientTypes_SynthesisTask):
    SynthesisTask object that provides information about a speech
    synthesis task.
  - [SynthesisTaskNotFoundException](/SynthesisTaskNotFoundException):
    The Speech Synthesis task with requested Task ID cannot be
    found.
  - [SynthesizeSpeechInputBodyMiddleware](/SynthesizeSpeechInputBodyMiddleware)
  - [SynthesizeSpeechInputHeadersMiddleware](/SynthesizeSpeechInputHeadersMiddleware)
  - [SynthesizeSpeechInputQueryItemMiddleware](/SynthesizeSpeechInputQueryItemMiddleware)
  - [SynthesizeSpeechInputGETQueryItemMiddleware](/SynthesizeSpeechInputGETQueryItemMiddleware)
  - [SynthesizeSpeechInputURLPathMiddleware](/SynthesizeSpeechInputURLPathMiddleware)
  - [SynthesizeSpeechInput](/SynthesizeSpeechInput)
  - [SynthesizeSpeechOutputResponse](/SynthesizeSpeechOutputResponse)
  - [TextLengthExceededException](/TextLengthExceededException):
    The value of the "Text" parameter is longer than the accepted
    limits. For the SynthesizeSpeech API, the limit for input
    text is a maximum of 6000 characters total, of which no more than 3000 can
    be billed characters. For the StartSpeechSynthesisTask API,
    the maximum is 200,000 characters, of which no more than 100,000 can be
    billed characters. SSML tags are not counted as billed
    characters.
  - [UnsupportedPlsAlphabetException](/UnsupportedPlsAlphabetException):
    The alphabet specified by the lexicon is not a supported alphabet.
    Valid values are x-sampa and ipa.
  - [UnsupportedPlsLanguageException](/UnsupportedPlsLanguageException):
    The language specified in the lexicon is unsupported. For a list of
    supported languages, see <a href="https://docs.aws.amazon.com/polly/latest/dg/API_LexiconAttributes.html">Lexicon Attributes.
  - [PollyClientTypes.Voice](/PollyClientTypes_Voice):
    Description of the voice.

# Protocols

  - [PollyClientProtocol](/PollyClientProtocol):
    Amazon Polly is a web service that makes it easy to synthesize speech from
    text.
    The Amazon Polly service provides API operations for synthesizing
    high-quality speech from plain text and Speech Synthesis Markup Language
    (SSML), along with managing pronunciations lexicons that enable you to get
    the best results for your application domain.
