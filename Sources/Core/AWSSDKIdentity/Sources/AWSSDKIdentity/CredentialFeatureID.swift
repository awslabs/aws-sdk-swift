//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public enum CredentialFeatureID: String {
//    case CREDENTIALS_CODE = "e"
//    case CREDENTIALS_JVM_SYSTEM_PROPERTIES = "f"
    case CREDENTIALS_ENV_VARS = "g"
    case CREDENTIALS_ENV_VARS_STS_WEB_ID_TOKEN = "h"
    case CREDENTIALS_STS_ASSUME_ROLE = "i"
//    case CREDENTIALS_STS_ASSUME_ROLE_SAML = "j"
    case CREDENTIALS_STS_ASSUME_ROLE_WEB_ID = "k"
//    case CREDENTIALS_STS_FEDERATION_TOKEN = "l"
//    case CREDENTIALS_STS_SESSION_TOKEN = "m"
    case CREDENTIALS_PROFILE = "n"
    case CREDENTIALS_PROFILE_SOURCE_PROFILE = "o"
    case CREDENTIALS_PROFILE_NAMED_PROVIDER = "p"
    case CREDENTIALS_PROFILE_STS_WEB_ID_TOKEN = "q"
    case CREDENTIALS_PROFILE_SSO = "r"
    case CREDENTIALS_SSO = "s"
    case CREDENTIALS_PROFILE_SSO_LEGACY = "t"
    case CREDENTIALS_SSO_LEGACY = "u"
    case CREDENTIALS_PROFILE_PROCESS = "v"
    case CREDENTIALS_PROCESS = "w"
//    case CREDENTIALS_BOTO2_CONFIG_FILE = "x"
//    case CREDENTIALS_AWS_SDK_STORE = "y"
    case CREDENTIALS_HTTP = "z"
    case CREDENTIALS_IMDS = "0"
    case CREDENTIALS_COGNITO = "8"
}
