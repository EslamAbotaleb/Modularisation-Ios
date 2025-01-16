// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let sharedDependencies = "SharedDependencies"

let package = Package(
    name: "ArtistDetail",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ArtistDetail",
            targets: ["ArtistDetail"]),
    ],
    dependencies: [
        .package(name: sharedDependencies, path: "../../../\(sharedDependencies)"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ArtistDetail",
            dependencies: [
                .product(name: sharedDependencies, package: sharedDependencies),
            ]),
        .testTarget(
            name: "ArtistDetailTests",
            dependencies: ["ArtistDetail"]
        ),
    ]
)
