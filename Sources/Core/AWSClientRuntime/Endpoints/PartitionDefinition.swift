//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

// Partition definitions are embedded as a static resource in this project, for now.
// When Trebuchet integration is performed, partitions should be obtained from Trebuchet for every
// build instead of being loaded from a static definition.
public let partitionJSON = """
{
  "version": "1.1",
  "partitions": [
    {
      "id": "aws",
      "regionRegex": "^(us|eu|ap|sa|ca|me|af|il)-\\\\w+-\\\\d+$",
      "regions": {
        "af-south-1": {
          "description": "Africa (Cape Town)"
        },
        "ap-east-1": {
          "description": "Asia Pacific (Hong Kong)"
        },
        "ap-northeast-1": {
          "description": "Asia Pacific (Tokyo)"
        },
        "ap-northeast-2": {
          "description": "Asia Pacific (Seoul)"
        },
        "ap-northeast-3": {
          "description": "Asia Pacific (Osaka)"
        },
        "ap-south-1": {
          "description": "Asia Pacific (Mumbai)"
        },
        "ap-south-2": {
          "description": "Asia Pacific (Hyderabad)"
        },
        "ap-southeast-1": {
          "description": "Asia Pacific (Singapore)"
        },
        "ap-southeast-2": {
          "description": "Asia Pacific (Sydney)"
        },
        "ap-southeast-3": {
          "description": "Asia Pacific (Jakarta)"
        },
        "ap-southeast-4": {
          "description": "Asia Pacific (Melbourne)"
        },
        "aws-global": {
          "description": "AWS Standard global region"
        },
        "ca-central-1": {
          "description": "Canada (Central)"
        },
        "ca-west-1": {
          "description": "Canada West (Calgary)"
        },
        "eu-central-1": {
          "description": "Europe (Frankfurt)"
        },
        "eu-central-2": {
          "description": "Europe (Zurich)"
        },
        "eu-north-1": {
          "description": "Europe (Stockholm)"
        },
        "eu-south-1": {
          "description": "Europe (Milan)"
        },
        "eu-south-2": {
          "description": "Europe (Spain)"
        },
        "eu-west-1": {
          "description": "Europe (Ireland)"
        },
        "eu-west-2": {
          "description": "Europe (London)"
        },
        "eu-west-3": {
          "description": "Europe (Paris)"
        },
        "il-central-1": {
          "description": "Israel (Tel Aviv)"
        },
        "me-central-1": {
          "description": "Middle East (UAE)"
        },
        "me-south-1": {
          "description": "Middle East (Bahrain)"
        },
        "sa-east-1": {
          "description": "South America (Sao Paulo)"
        },
        "us-east-1": {
          "description": "US East (N. Virginia)"
        },
        "us-east-2": {
          "description": "US East (Ohio)"
        },
        "us-west-1": {
          "description": "US West (N. California)"
        },
        "us-west-2": {
          "description": "US West (Oregon)"
        }
      },
      "outputs": {
        "name": "aws",
        "dnsSuffix": "amazonaws.com",
        "dualStackDnsSuffix": "api.aws",
        "supportsFIPS": true,
        "supportsDualStack": true,
        "implicitGlobalRegion": "us-east-1"
      }
    },
    {
      "id": "aws-cn",
      "regionRegex": "^cn\\\\-\\\\w+\\\\-\\\\d+$",
      "regions": {
        "aws-cn-global": {
          "description": "AWS China global region"
        },
        "cn-north-1": {
          "description": "China (Beijing)"
        },
        "cn-northwest-1": {
          "description": "China (Ningxia)"
        }
      },
      "outputs": {
        "name": "aws-cn",
        "dnsSuffix": "amazonaws.com.cn",
        "dualStackDnsSuffix": "api.amazonwebservices.com.cn",
        "supportsFIPS": true,
        "supportsDualStack": true,
        "implicitGlobalRegion": "cn-northwest-1"
      }
    },
    {
      "id": "aws-us-gov",
      "regionRegex": "^us\\\\-gov\\\\-\\\\w+\\\\-\\\\d+$",
      "regions": {
        "aws-us-gov-global": {
          "description": "AWS GovCloud (US) global region"
        },
        "us-gov-east-1": {
          "description": "AWS GovCloud (US-East)"
        },
        "us-gov-west-1": {
          "description": "AWS GovCloud (US-West)"
        }
      },
      "outputs": {
        "name": "aws-us-gov",
        "dnsSuffix": "amazonaws.com",
        "dualStackDnsSuffix": "api.aws",
        "supportsFIPS": true,
        "supportsDualStack": true,
        "implicitGlobalRegion": "us-gov-west-1"
      }
    },
    {
      "id": "aws-iso",
      "regionRegex": "^us\\\\-iso\\\\-\\\\w+\\\\-\\\\d+$",
      "regions": {
        "aws-iso-global": {
          "description": "AWS ISO (US) global region"
        },
        "us-iso-east-1": {
          "description": "US ISO East"
        },
        "us-iso-west-1": {
          "description": "US ISO WEST"
        }
      },
      "outputs": {
        "name": "aws-iso",
        "dnsSuffix": "c2s.ic.gov",
        "dualStackDnsSuffix": "c2s.ic.gov",
        "supportsFIPS": true,
        "supportsDualStack": false,
        "implicitGlobalRegion": "us-iso-east-1"
      }
    },
    {
      "id": "aws-iso-b",
      "regionRegex": "^us\\\\-isob\\\\-\\\\w+\\\\-\\\\d+$",
      "regions": {
        "aws-iso-b-global": {
          "description": "AWS ISOB (US) global region"
        },
        "us-isob-east-1": {
          "description": "US ISOB East (Ohio)"
        }
      },
      "outputs": {
        "name": "aws-iso-b",
        "dnsSuffix": "sc2s.sgov.gov",
        "dualStackDnsSuffix": "sc2s.sgov.gov",
        "supportsFIPS": true,
        "supportsDualStack": false,
        "implicitGlobalRegion": "us-isob-east-1"
      }
    },
    {
      "id": "aws-iso-e",
      "regionRegex": "^eu\\\\-isoe\\\\-\\\\w+\\\\-\\\\d+$",
      "regions": { },
      "outputs": {
        "name": "aws-iso-e",
        "dnsSuffix": "cloud.adc-e.uk",
        "dualStackDnsSuffix": "cloud.adc-e.uk",
        "supportsFIPS": true,
        "supportsDualStack": false,
        "implicitGlobalRegion": "eu-isoe-west-1"
      }
    },
    {
      "id": "aws-iso-f",
      "regionRegex": "^us\\\\-isof\\\\-\\\\w+\\\\-\\\\d+$",
      "regions": { },
      "outputs": {
        "name": "aws-iso-f",
        "dnsSuffix": "csp.hci.ic.gov",
        "dualStackDnsSuffix": "csp.hci.ic.gov",
        "supportsFIPS": true,
        "supportsDualStack": false,
        "implicitGlobalRegion": "us-isof-south-1"
      }
    }
  ]
}
"""
