// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PsionSoftwareIndexSwift",
    platforms: [
        .iOS(.v15),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "PsionSoftwareIndex",
            targets: ["PsionSoftwareIndex"]),
    ],
    dependencies: [
        .package(url: "https://github.com/inseven/interact.git", from: "3.6.0"),
        .package(url: "https://github.com/inseven/licensable.git", from: "0.0.13"),
    ],
    targets: [
        .target(
            name: "PsionSoftwareIndex",
            dependencies: [
                .product(name: "Interact", package: "interact"),
                .product(name: "Licensable", package: "licensable"),
            ],
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
