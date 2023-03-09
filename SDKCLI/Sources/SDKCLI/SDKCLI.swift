import ArgumentParser

@main
struct SDKCLI: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "sdkcli",
        abstract: "CLI for operating the AWS SDK for Swift",
        subcommands: [
            TagSmithySwift.self
        ]
    )
}
