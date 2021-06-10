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
                url: "https://github.com/Alqueraf/twitter-kit-ios/releases/download/v5.4.0/TwitterKit.xcframework.zip",
                checksum: "778d280e60d9b9af66756737c6abc1ef7a9c64bc63ab431de804db5a55acd25a"
            ),
    ]
)
