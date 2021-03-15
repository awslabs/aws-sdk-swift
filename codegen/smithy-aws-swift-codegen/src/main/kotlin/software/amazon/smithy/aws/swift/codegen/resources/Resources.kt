package software.amazon.smithy.aws.swift.codegen.resources

import java.io.File

fun computeAbsolutePath(relativePath: String, environmentVariableOverride: String? = null): String {
    if (environmentVariableOverride != null) {
        val userDirPathOverride = System.getenv(environmentVariableOverride)
        if (!userDirPathOverride.isNullOrEmpty()) {
            return userDirPathOverride
        }
    }

    var userDirPath = System.getProperty("user.dir")
    while (userDirPath.isNotEmpty()) {
        val fileName = userDirPath.removeSuffix("/") + "/" + relativePath
        if (File(fileName).isDirectory) {
            return fileName
        }
        userDirPath = userDirPath.substring(0, userDirPath.length - 1)
    }
    return ""
}
