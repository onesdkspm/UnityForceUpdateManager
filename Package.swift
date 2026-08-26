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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityForceUpdateManager/1.0.0-dev-1515208/UnityForceUpdateManager.xcframework.zip",
            checksum: "270ef185e3f729376e75c1a886cca0d51f296a653de82d29ae6842ba546e6b2c"
        )
    ]
)
