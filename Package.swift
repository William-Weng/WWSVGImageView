// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWSVGImageView",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "WWSVGImageView", targets: ["WWSVGImageView"]),
    ],
    targets: [
        .target(name: "WWSVGImageView", resources: [.copy("Privacy")]),
    ], swiftLanguageVersions: [
        .v5
    ]
)
