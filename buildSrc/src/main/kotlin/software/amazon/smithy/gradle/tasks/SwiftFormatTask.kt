package software.amazon.smithy.gradle.tasks

import org.gradle.api.DefaultTask
import org.gradle.api.GradleException
import org.gradle.api.tasks.Input
import org.gradle.api.tasks.TaskAction

open class SwiftFormatTask: DefaultTask() {
    @get:Input
    var pathToGeneratedSDK = "."

    @TaskAction
    fun runSwiftFormat() {
        val generatedBuildDir = project.file(pathToGeneratedSDK)
        if (!generatedBuildDir.exists()) {
            throw GradleException("$generatedBuildDir does not exist")
        }
        val exists = project.exec {
            workingDir = generatedBuildDir
            executable = "swift-format"
            args = listOf("--version")
        }.exitValue

        if (exists == 0) {
            project.exec {
                workingDir = generatedBuildDir
                executable = "swift-format"
                args = listOf("format . -i -r")
            }
        }
        else {
            println("warning: Could not find swift format in host machine. Skip formatting generated SDK.")
        }
    }
}