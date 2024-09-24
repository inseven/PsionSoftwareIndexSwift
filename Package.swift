// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PsionSoftwareIndexSwift",
    platforms: [
        .iOS(.v15),
        // .macOS(.v13),
    ],
    products: [
        .library(
            name: "PsionSoftwareIndex",
            targets: ["PsionSoftwareIndex"]),
    ],
    targets: [
        .target(
            name: "PsionSoftwareIndex",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "PsionSoftwareIndexSwiftTests",
            dependencies: [
                "PsionSoftwareIndex"
            ]
        ),
    ]
)
