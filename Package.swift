// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SCTokens",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SCTokens",
            targets: ["SCTokens"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SCTokens",
            resources: [
                .copy("Resources/fonts/Urbanist-Bold.ttf"),
                .copy("Resources/fonts/Urbanist-SemiBold.ttf"),
                .copy("Resources/fonts/Urbanist-Medium.ttf"),
                .copy("Resources/fonts/Urbanist-Light.ttf"),
                .copy("Resources/fonts/Urbanist-Regular.ttf"),
            ]
        ),
        .testTarget(
            name: "SCTokensTests",
            dependencies: ["SCTokens"]),
    ]
)
