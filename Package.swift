// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ObserverPattern",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ObserverPattern",
            targets: ["ObserverPattern"]),
    ],
    targets: [
        .target(
            name: "ObserverPattern",
            dependencies: []),
        .testTarget(
            name: "ObserverPatternTests",
            dependencies: ["ObserverPattern"]),
    ]
)
