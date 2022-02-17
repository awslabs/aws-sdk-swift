// TODO: remove this file when https://bugs.swift.org/browse/SR-13773?focusedCommentId=64312&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-64312 is resolved. This file is purely a workaround for the time being.
import class Foundation.Bundle

private class BundleFinder {}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var _module: Bundle = {
        let bundleName = "TestSdk_TestSdk"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named TestSdk_TestSdk")
    }()
}
