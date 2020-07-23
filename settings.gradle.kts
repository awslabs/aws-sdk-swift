pluginManagement {
    repositories {
        maven { url = uri("https://dl.bintray.com/kotlin/kotlin-eap") }
        maven { url = uri("https://kotlin.bintray.com/kotlinx") }

        gradlePluginPortal()
    }
}

rootProject.name = "aws-sdk-swift"
enableFeaturePreview("GRADLE_METADATA")


fun module(path: String) {
    val name = path.replace('\\', '/').substringAfterLast('/')
    include(name)
    project(":$name").projectDir = file(path)
}


module("codegen")
module("codegen/smithy-aws-swift-codegen")
module("codegen/protocol-test-codegen")
