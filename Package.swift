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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityForceUpdateManager/1.0.0-dev-1515742/UnityForceUpdateManager.xcframework.zip",
            checksum: "db25951e3361267782626c5d7b2574672112c337fa1f1760697ac4af22ec6ace"
        )
    ]
)
