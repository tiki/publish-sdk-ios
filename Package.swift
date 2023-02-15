// swift-tools-version:5.5.0

import PackageDescription

let package = Package(
    name: "TikiSdk",
    platforms: [
            .iOS(.v13)
    ],
    products: [
        .library(
            name: "TikiSdk",
            targets: ["TikiSdk"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TikiSdk",
            dependencies: [
                           "App",
                           "flutter_secure_storage",
                           "Flutter",
                           "FlutterPluginRegistrant",
                           "path_provider_foundation",
                           "sqlite3_flutter_libs",
                           "sqlite3",
                          ]),
        
        .binaryTarget(name: "App",
                      url: "https://github.com/tiki/tiki-sdk-flutter/releases/download/1.1.2/App.xcframework.zip",
                      checksum: "28d131408bbfeac69176beed9c60012737c4cfdd046759024dc5106e6d697973"),
        
        .binaryTarget(name: "Flutter",
                      url: "https://github.com/tiki/tiki-sdk-flutter/releases/download/1.1.2/Flutter.xcframework.zip",
                      checksum: "7eea274fcee13724703e229d9fd8a8c1742ddcbcfe90b9f4ade8bece78b2e07c"),
                          
        .binaryTarget(name: "FlutterPluginRegistrant",
                      url: "https://github.com/tiki/tiki-sdk-flutter/releases/download/1.1.2/FlutterPluginRegistrant.xcframework.zip",
                      checksum: "e92c4827c477b9b9df6d53fb1a30f836cc78437e4103ca30f5b37172d8f61d50"),
        
        .binaryTarget(name: "flutter_secure_storage",
                      url: "https://github.com/tiki/tiki-sdk-flutter/releases/download/1.1.2/flutter_secure_storage.xcframework.zip",
                      checksum: "728bbae8675839d096dd73030a7780c4c841c935dbdfa1f1ed3db2d60d57b707"),
        
        .binaryTarget(name: "path_provider_foundation",
                      url: "https://github.com/tiki/tiki-sdk-flutter/releases/download/1.1.2/path_provider_foundation.xcframework.zip",
                      checksum: "699952953f76bf574655183e3350315506a8ec1cb3ae3ca331ce328cd7792262"),
        
        .binaryTarget(name: "sqlite3_flutter_libs",
                      url: "https://github.com/tiki/tiki-sdk-flutter/releases/download/1.1.2/sqlite3_flutter_libs.xcframework.zip",
                    checksum: "ba3c327058ead10c3017e9a8e089ad86ac9d870e7949f63ef05257402771ff1b"),
        
        .binaryTarget(name: "sqlite3",
                      url: "https://github.com/tiki/tiki-sdk-flutter/releases/download/1.1.2/sqlite3.xcframework.zip",
                      checksum: "d3255815f1d7c6e83172ab8b0daa082a6b696e66ad803b1654264784c6315855"),
        ]
)

package.dependencies.append(
    .package(url: "https://github.com/SwiftPackageIndex/SPIManifest.git", from: "0.12.0")
)
