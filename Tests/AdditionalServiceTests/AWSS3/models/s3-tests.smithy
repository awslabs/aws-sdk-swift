$version: "1.0"

namespace com.amazonaws.s3
use smithy.test#httpRequestTests

apply DeleteObjectTagging @httpRequestTests([
    {
        id: "Protocol_S3EscapeObjectKeyInUriLabel",
        documentation: """
            S3 clients should escape special characters in Object Keys
            when the Object Key is used as a URI label binding.
        """,
        protocol: "aws.protocols#restXml",
        method: "DELETE",
        uri: "/my%20key.txt",
        host: "s3.us-west-2.amazonaws.com",
        resolvedHost: "mybucket.s3.us-west-2.amazonaws.com",
        body: "",
        headers: {
            "Content-Type": "application/json"
        },
        params: {
            Bucket: "mybucket",
            Key: "my key.txt"
        }
    },
    {
        id: "Protocol_S3EscapePathObjectKeyInUriLabel",
        documentation: """
            S3 clients should preserve an Object Key representing a path
            when the Object Key is used as a URI label binding, but still
            escape special characters.
        """,
        protocol: "aws.protocols#restXml",
        method: "DELETE",
        uri: "/foo/bar/my%20key.txt",
        host: "s3.us-west-2.amazonaws.com",
        resolvedHost: "mybucket.s3.us-west-2.amazonaws.com",
        body: "",
        headers: {
            "Content-Type": "application/json"
        },
        params: {
            Bucket: "mybucket",
            Key: "foo/bar/my key.txt"
        }
    }
])
@http(
    method: "DELETE",
    uri: "/{Bucket}/{Key+}?tagging",
    code: 204
)
operation DeleteObjectTagging {
    input: DeleteObjectTaggingRequest
    output: DeleteObjectTaggingOutput
}

apply GetObject @httpRequestTests([
    {
        "id": "Protocol_S3PreservesLeadingDotSegmentInUriLabel",
        "documentation": "    S3 clients should not remove dot segments from request paths.\n",
        "protocol": "aws.protocols#restXml",
        "method": "GET",
        "uri": "/../key.txt",
        "host": "s3.us-west-2.amazonaws.com",
        "resolvedHost": "mybucket.s3.us-west-2.amazonaws.com",
        "body": "",
        "queryParams": [
            "tagging"
        ],
        "params": {
            "Bucket": "mybucket",
            "Key": "../key.txt"
        }
    },
    {
        "id": "Protocol_S3PreservesEmbeddedDotSegmentInUriLabel",
        "documentation": "    S3 clients should not remove dot segments from request paths.\n",
        "protocol": "aws.protocols#restXml",
        "method": "GET",
        "uri": "foo/../key.txt",
        "host": "s3.us-west-2.amazonaws.com",
        "resolvedHost": "mybucket.s3.us-west-2.amazonaws.com",
        "body": "",
        "queryParams": [
            "tagging"
        ],
        "params": {
            "Bucket": "mybucket",
            "Key": "foo/../key.txt"
        }
    }
])
