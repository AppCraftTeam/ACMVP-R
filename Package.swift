// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ACMVP",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "ACMVP",
            targets: ["ACMVP"]),
    ],
    dependencies: [
        .package(
            name: "ACExtensions",
            url: "https://github.com/AppCraftTeam/ACExtensions.git",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "ACMVP",
            dependencies: ["ACExtensions"]),
        .testTarget(
            name: "ACMVPTests",
            dependencies: ["ACMVP"]),
    ]
)
