// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UnityForceUpdateManager",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UnityForceUpdateManager",
            targets: ["UnityForceUpdateManagerWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/BTSimpleHTTPNetworking.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.3"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "UnityForceUpdateManagerWrapper",
            dependencies: [
                .byName(name: "UnityForceUpdateManager"),
                .product(name: "BTSimpleHTTPNetworking", package: "BTSimpleHTTPNetworking"),
                .product(name: "UnityBridge", package: "UnityBridge"),
            ],
            path: "UnityForceUpdateManagerWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "UnityForceUpdateManager",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityForceUpdateManager/1.0.0-dev-1511948/UnityForceUpdateManager.xcframework.zip",
            checksum: "0d7fc55b1f019099af727d724c5f639e5acd78ce355d0b354719c9e56614996a"
        )
    ]
)
