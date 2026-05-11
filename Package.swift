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
        .package(url: "https://github.com/rarestype/h", from: "1.0.0"),
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
                .product(name: "SHA2", package: "h"),
            ]
        ),
        .testTarget(
            name: "SwiftSentryTests",
            dependencies: ["SwiftSentry"]
        ),
    ]
)
