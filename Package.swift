// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TwitterKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "TwitterKit", targets: ["TwitterKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        
        // https://github.com/ResultsDirect/TwitterKit/blob/main/Package.swift
        // Get checksum using "shasum -a 256 TwitterKit.xcframework.zip"
        .binaryTarget(
                name: "TwitterKit",
                url: "https://github.com/Alqueraf/twitter-kit-ios/releases/download/5.4.3/TwitterKit.xcframework.zip",
                checksum: "79086298e166aa36b37dc1ec2e5c7a4437e79fa62280d2fcde38cd0aed30afad"
            ),
    ]
)
