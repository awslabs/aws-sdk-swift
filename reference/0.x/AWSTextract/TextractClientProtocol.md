# TextractClientProtocol

Amazon Textract detects and analyzes text in documents and converts it
into machine-readable text. This is the API reference documentation for
Amazon Textract.

``` swift
public protocol TextractClientProtocol 
```

## Requirements

### analyzeDocument(input:​completion:​)

Analyzes an input document for relationships between detected items.
The types of information returned are as follows:​

``` swift
func analyzeDocument(input: AnalyzeDocumentInput, completion: @escaping (ClientRuntime.SdkResult<AnalyzeDocumentOutputResponse, AnalyzeDocumentOutputError>) -> Void)
```

``` 
           Form data (key-value pairs). The related information is returned in two Block objects, each of type KEY_VALUE_SET: a KEY
              Block object and a VALUE Block object. For example,
              Name: Ana Silva Carolina contains a key and value.
              Name: is the key. Ana Silva Carolina is
           the value.


           Table and table cell data. A TABLE Block object contains information about a detected table. A CELL
           Block object is returned for each cell in a table.


           Lines and words of text. A LINE Block object contains one or more WORD Block objects.
    All lines and words that are detected in the document are returned (including text that doesn't have a
           relationship with the value of FeatureTypes).



     Selection elements such as check boxes and option buttons (radio buttons) can be detected in form data and in tables.
     A SELECTION_ELEMENT Block object contains information about a selection element,
     including the selection status.
     You can choose which type of analysis to perform by specifying the FeatureTypes list.

     The output is returned in a list of Block objects.

        AnalyzeDocument is a synchronous operation. To analyze documents
  asynchronously, use StartDocumentAnalysis.
     For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis.
```

### analyzeExpense(input:​completion:​)

Analyzes an input document for financially related relationships between text.
Information is returned as ExpenseDocuments and seperated as follows.

``` swift
func analyzeExpense(input: AnalyzeExpenseInput, completion: @escaping (ClientRuntime.SdkResult<AnalyzeExpenseOutputResponse, AnalyzeExpenseOutputError>) -> Void)
```

``` 
              LineItemGroups- A data set containing LineItems which
     store information about the lines of text, such as an item purchased and its price on a receipt.



              SummaryFields- Contains all other information a receipt, such as header information
     or the vendors name.
```

### detectDocumentText(input:​completion:​)

Detects text in the input document. Amazon Textract can detect lines of text and the
words that make up a line of text. The input document must be an image in JPEG or PNG
format. DetectDocumentText returns the detected text in an array of Block objects.
Each document page has as an associated Block of type PAGE. Each PAGE Block object
is the parent of LINE Block objects that represent the lines of detected text on a page. A LINE Block object is
a parent for each word that makes up the line. Words are represented by Block objects of type WORD.

``` swift
func detectDocumentText(input: DetectDocumentTextInput, completion: @escaping (ClientRuntime.SdkResult<DetectDocumentTextOutputResponse, DetectDocumentTextOutputError>) -> Void)
```

``` 
        DetectDocumentText is a synchronous operation. To analyze documents
     asynchronously, use StartDocumentTextDetection.
     For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection.
```

### getDocumentAnalysis(input:​completion:​)

Gets the results for an Amazon Textract asynchronous operation that analyzes text in a document.
You start asynchronous text analysis by calling StartDocumentAnalysis, which returns a job identifier
(JobId). When the text analysis operation finishes, Amazon Textract publishes a
completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to
StartDocumentAnalysis. To get the results of the text-detection operation,
first check that the status value published to the Amazon SNS topic is SUCCEEDED.
If so, call GetDocumentAnalysis, and pass the job identifier
(JobId) from the initial call to StartDocumentAnalysis.

``` swift
func getDocumentAnalysis(input: GetDocumentAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentAnalysisOutputResponse, GetDocumentAnalysisOutputError>) -> Void)
```

``` 
        GetDocumentAnalysis returns an array of Block objects. The following
     types of information are returned:


           Form data (key-value pairs). The related information is returned in two Block objects, each of type KEY_VALUE_SET: a KEY
        Block object and a VALUE Block object. For example,
        Name: Ana Silva Carolina contains a key and value.
        Name: is the key. Ana Silva Carolina is
        the value.


           Table and table cell data. A TABLE Block object contains information about a detected table. A CELL
        Block object is returned for each cell in a table.


           Lines and words of text. A LINE Block object contains one or more WORD Block objects.
        All lines and words that are detected in the document are returned (including text that doesn't have a
        relationship with the value of the StartDocumentAnalysis
              FeatureTypes input parameter).



     Selection elements such as check boxes and option buttons (radio buttons) can be detected in form data and in tables.
     A SELECTION_ELEMENT Block object contains information about a selection element,
     including the selection status.



     Use the MaxResults parameter to limit the number of blocks that are
     returned. If there are more results than specified in MaxResults, the value of
        NextToken in the operation response contains a pagination token for getting
     the next set of results. To get the next page of results, call
        GetDocumentAnalysis, and populate the NextToken request
     parameter with the token value that's returned from the previous call to
        GetDocumentAnalysis.
     For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis.
```

### getDocumentTextDetection(input:​completion:​)

Gets the results for an Amazon Textract asynchronous operation that detects text in a document.
Amazon Textract can detect lines of text and the words that make up a line of text.
You start asynchronous text detection by calling StartDocumentTextDetection, which returns a job identifier
(JobId). When the text detection operation finishes, Amazon Textract publishes a
completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to
StartDocumentTextDetection. To get the results of the text-detection
operation, first check that the status value published to the Amazon SNS topic is
SUCCEEDED. If so, call GetDocumentTextDetection, and pass the
job identifier (JobId) from the initial call to
StartDocumentTextDetection.

``` swift
func getDocumentTextDetection(input: GetDocumentTextDetectionInput, completion: @escaping (ClientRuntime.SdkResult<GetDocumentTextDetectionOutputResponse, GetDocumentTextDetectionOutputError>) -> Void)
```

``` 
        GetDocumentTextDetection returns an array of Block
     objects.
     Each document page has as an associated Block of type PAGE. Each PAGE Block object
    is the parent of LINE Block objects that represent the lines of detected text on a page. A LINE Block object is
    a parent for each word that makes up the line. Words are represented by Block objects of type WORD.

     Use the MaxResults parameter to limit the number of blocks that are returned. If there
     are more results than specified in MaxResults, the value of
        NextToken in the operation response contains a pagination token for getting
     the next set of results. To get the next page of results, call
        GetDocumentTextDetection, and populate the NextToken request
     parameter with the token value that's returned from the previous call to
        GetDocumentTextDetection.
     For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection.
```

### startDocumentAnalysis(input:​completion:​)

Starts the asynchronous analysis of an input document for relationships between detected
items such as key-value pairs, tables, and selection elements.

``` swift
func startDocumentAnalysis(input: StartDocumentAnalysisInput, completion: @escaping (ClientRuntime.SdkResult<StartDocumentAnalysisOutputResponse, StartDocumentAnalysisOutputError>) -> Void)
```

``` 
        StartDocumentAnalysis can analyze text in documents that are in JPEG, PNG, and PDF format. The
     documents are stored in an Amazon S3 bucket. Use DocumentLocation to specify the bucket name and file name
     of the document.


        StartDocumentAnalysis returns a job identifier
        (JobId) that you use to get the results of the operation. When text
     analysis is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS)
     topic that you specify in NotificationChannel. To get the results of the text
     analysis operation, first check that the status value published to the Amazon SNS topic is
        SUCCEEDED. If so, call GetDocumentAnalysis, and pass
     the job identifier (JobId) from the initial call to
        StartDocumentAnalysis.
     For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-analyzing.html">Document Text Analysis.
```

### startDocumentTextDetection(input:​completion:​)

Starts the asynchronous detection of text in a document. Amazon Textract can detect lines of
text and the words that make up a line of text.

``` swift
func startDocumentTextDetection(input: StartDocumentTextDetectionInput, completion: @escaping (ClientRuntime.SdkResult<StartDocumentTextDetectionOutputResponse, StartDocumentTextDetectionOutputError>) -> Void)
```

``` 
        StartDocumentTextDetection can analyze text in documents that are in JPEG, PNG, and PDF format. The
    documents are stored in an Amazon S3 bucket. Use DocumentLocation to specify the bucket name and file name
    of the document.


        StartTextDetection returns a job identifier
        (JobId) that you use to get the results of the operation. When text
     detection is finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS)
     topic that you specify in NotificationChannel. To get the results of the text
     detection operation, first check that the status value published to the Amazon SNS topic is
        SUCCEEDED. If so, call GetDocumentTextDetection, and
     pass the job identifier (JobId) from the initial call to
        StartDocumentTextDetection.
     For more information, see <a href="https://docs.aws.amazon.com/textract/latest/dg/how-it-works-detecting.html">Document Text Detection.
```
