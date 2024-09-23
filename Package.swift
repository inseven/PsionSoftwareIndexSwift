// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PsionSoftwareIndexSwift",
    products: [
        .library(
            name: "PsionSoftwareIndexSwift",
            targets: ["PsionSoftwareIndexSwift"]),
    ],
    targets: [
        .target(
            name: "PsionSoftwareIndexSwift"),
        .testTarget(
            name: "PsionSoftwareIndexSwiftTests",
            dependencies: ["PsionSoftwareIndexSwift"]
        ),
    ]
)
