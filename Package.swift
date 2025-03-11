// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "swift-sentry",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "swift-sentry",
            targets: ["SwiftSentry"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/stackotter/swift-hash",
            .upToNextMinor(from: "0.6.4")
        )
    ],
    targets: [
        .target(
            name: "sentry",
            publicHeadersPath: "include",
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ]
        ),
        .target(
            name: "SwiftSentry",
            dependencies: [
                "sentry",
                .product(name: "SHA2", package: "swift-hash"),
            ]
        ),
        .testTarget(
            name: "SwiftSentryTests",
            dependencies: ["SwiftSentry"]
        ),
    ]
)
