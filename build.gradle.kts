/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

plugins {
    kotlin("jvm")
    id("org.jetbrains.dokka")
}

allprojects {
    repositories {
        mavenLocal()
        mavenCentral()
    }
}

val ktlint by configurations.creating
val ktlintVersion: String by project
dependencies {
    ktlint("com.pinterest.ktlint:ktlint-cli:$ktlintVersion")
}

val lintPaths = listOf(
    "codegen/**/*.kt"
)

tasks.register<JavaExec>("ktlint") {
    description = "Check Kotlin code style."
    group = "Verification"
    classpath = configurations.getByName("ktlint")
    mainClass.set("com.pinterest.ktlint.Main")
    args = lintPaths
}

tasks.register<JavaExec>("ktlintFormat") {
    description = "Auto fix Kotlin code style violations"
    group = "formatting"
    classpath = configurations.getByName("ktlint")
    mainClass.set("com.pinterest.ktlint.Main")
    args = listOf("-F") + lintPaths
}

// Swift lint tasks (mirrors CI lint.yml workflow)

tasks.register<Exec>("swiftlint") {
    description = "Run swiftlint (standard + analyzer on compiled code), matching CI."
    group = "Verification"
    commandLine("bash", "scripts/swiftlint-ci.sh")
}

tasks.register<Exec>("swiftlintFormat") {
    description = "Auto fix Swift lint violations (standard + analyzer)."
    group = "formatting"
    commandLine("bash", "scripts/swiftlint-ci.sh", "--fix")
}

tasks.register<Exec>("swiftlintAnalyze") {
    description = "Run swiftlint analyzer only (requires compilation)."
    group = "Verification"
    commandLine("bash", "scripts/swiftlint-ci.sh", "--analyze-only")
}
