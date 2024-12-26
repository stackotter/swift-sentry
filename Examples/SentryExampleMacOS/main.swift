// SPDX-License-Identifier: BSD-3-Clause

import AppKit
import Foundation
import SwiftSentry

@main
enum MacOSExample {
    static func main() {
        let app = NSApplication.shared
        startSentry()
        defer { SentrySDK.close() }

        print("Hello macOS")

        app.run()
    }

    static func startSentry() {
        Task { @MainActor in
            SentrySDK.start { options in
                options.dsn = "your-dsn-goes-here"
                options.debug = true
            }

            let user = User(userId: "1", email: "archie@arc.net")
            SentrySDK.setUser(user)

            let crumb = Breadcrumb(withLevel: .warning, category: "info")
            crumb.message = "We've started Sentry"
            crumb.data = [
                "processors": Int32(ProcessInfo.processInfo.activeProcessorCount)
            ]

            SentrySDK.addBreadcrumb(crumb)
        }
    }
}
