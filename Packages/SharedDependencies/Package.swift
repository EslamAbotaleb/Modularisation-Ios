// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let analyticsInterface = "AnalyticsInterface"
private let commonModels = "CommonModels"
//private let dependencyContainer = "DependencyContainer"
private let artistDetailInterface = "ArtistDetailInterface"
private let songDetailsInterface = "SongDetailsInterface"
private let localisation = "Localisation"
private let utilities =  "Utilities"

let package = Package(
    name: "SharedDependencies",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SharedDependencies",
            targets:
                ["SharedDependencies"]),
    ],
    dependencies: [
        .package(name: analyticsInterface, path: "../../../\(analyticsInterface)"),
        .package(name: commonModels, path: "../\(commonModels)"),
//        .package(name: dependencyContainer, path: "../\(dependencyContainer)"),
        .package(name: songDetailsInterface, path: "../Modules/SongDetails/\(songDetailsInterface)"),
        .package(name: artistDetailInterface, path: "../Modules/ArtistDetail/\(artistDetailInterface)"),
        .package(name: localisation, path: "../\(localisation)"),
        .package(name: utilities, path: "../\(utilities)")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
                  name: "DependencyContainer",
                  path: "../.././Frameworks/DependencyContainer.xcframework"  // Path to your XCFramework
              ),
        .target(
            name: "SharedDependencies",

            dependencies: [
                .product(name: analyticsInterface, package: analyticsInterface),
                .product(name: commonModels, package: commonModels),
                
//                .product(name: dependencyContainer, package: dependencyContainer),
                .product(name: songDetailsInterface, package: songDetailsInterface),
                .product(name: artistDetailInterface, package: artistDetailInterface),
                .product(name: localisation, package: localisation),
                .product(name: utilities, package: utilities)
            ]
        )
    ]
)
