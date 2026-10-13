// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.0 by facebook/idb's .github/scripts/tap_formulae.py;
// each binary target is that release's asset. Edit nothing here.
import PackageDescription

let package = Package(
  name: "idb",
  platforms: [.macOS(.v15)],
  products: [
    .library(name: "FBArtifactStaging", targets: ["FBArtifactStaging", "FBControlCore", "ZstdDecompress", "FBControlCoreObjC"]),
    .library(name: "FBControlCore", targets: ["FBControlCore", "FBControlCoreObjC"]),
    .library(name: "FBControlCoreObjC", targets: ["FBControlCoreObjC"]),
    .library(name: "FBDeviceControl", targets: ["IDBPrivateHeaders", "FBDeviceControl", "FBControlCore", "FBXCTestCore", "FBVideoCore", "FBControlCoreObjC"]),
    .library(name: "FBProfilingCore", targets: ["FBProfilingCore", "FBControlCore", "FBControlCoreObjC"]),
    .library(name: "FBSimulatorAX", targets: ["AccessibilityPlatformTranslationStub", "CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorAX", "FBSimulatorBridgeProtocol", "FBControlCore", "FBSimulatorControl", "FBControlCoreObjC", "ShimulatorProtocol", "ShimulatorAudioInjectionCore", "SimulatorIPC"]),
    .library(name: "FBSimulatorBridgeProtocol", targets: ["FBSimulatorBridgeProtocol"]),
    .library(name: "FBSimulatorCodeInjection", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorCodeInjection", "FBControlCore", "FBSimulatorControl", "FBSimulatorXCTest", "FBXCTestCore", "FBControlCoreObjC", "ShimulatorProtocol", "ShimulatorAudioInjectionCore", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
    .library(name: "FBSimulatorControl", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorControl", "ShimulatorProtocol", "ShimulatorAudioInjectionCore", "FBControlCore", "FBSimulatorBridgeProtocol", "SimulatorIPC", "FBControlCoreObjC"]),
    .library(name: "FBSimulatorProfiling", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorProfiling", "FBControlCore", "FBProfilingCore", "FBSimulatorControl", "FBControlCoreObjC", "ShimulatorProtocol", "ShimulatorAudioInjectionCore", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
    .library(name: "FBSimulatorVideo", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorVideo", "FBControlCore", "FBSimulatorControl", "FBVideoCore", "FBControlCoreObjC", "ShimulatorProtocol", "ShimulatorAudioInjectionCore", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
    .library(name: "FBSimulatorXCTest", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorXCTest", "FBControlCore", "FBSimulatorControl", "FBXCTestCore", "FBControlCoreObjC", "ShimulatorProtocol", "ShimulatorAudioInjectionCore", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
    .library(name: "FBVideoCore", targets: ["FBVideoCore", "FBControlCore", "FBControlCoreObjC"]),
    .library(name: "FBXCTestCore", targets: ["FBXCTestCore", "FBControlCore", "FBControlCoreObjC"]),
    .library(name: "IDBConcurrency", targets: ["IDBConcurrency"]),
    .library(name: "IDBTelemetry", targets: ["IDBTelemetry"]),
    .library(name: "ShimulatorAudioInjectionCore", targets: ["ShimulatorAudioInjectionCore", "ShimulatorProtocol", "SimulatorIPC"]),
    .library(name: "ShimulatorProtocol", targets: ["ShimulatorProtocol", "SimulatorIPC"]),
    .library(name: "SimScopeProtocol", targets: ["SimScopeProtocol"]),
    .library(name: "SimulatorIPC", targets: ["SimulatorIPC"]),
    .library(name: "ZstdDecompress", targets: ["ZstdDecompress"]),
  ],
  targets: [
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.0/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "58698809c9b7acec19893b6dec22ba82068e00e25b1271c5103ec8c19ebf158e"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.0/CoreSimulatorStub.xcframework.zip", checksum: "c6ec59813254b889cc4dd87a2e40314af4b09ca13cc1728bf84e2a467e2f9974"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBArtifactStaging.xcframework.zip", checksum: "24f504cce506c7f41ce264416ba4079c2b81fb8001034e23d00a4b1ca24b9711"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBControlCore.xcframework.zip", checksum: "f1d4b5d989bd761f989d5a2b9f2028312a7c169cc17965fc88c363ef9d60e523"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBControlCoreObjC.xcframework.zip", checksum: "e8b16080892bcdde40a5bbd68e77a7ab54216f559e205c5b8f543b67bcd6455e"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBDeviceControl.xcframework.zip", checksum: "934622ea591eead6a7f1003ecedbc44987d009013a697101e914b219cedf35a1"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBProfilingCore.xcframework.zip", checksum: "fc77639e86eb5aa9dc5e896e7e1f55ef0f4da1f9c328f835b7dfe68767df3c28"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBSimulatorAX.xcframework.zip", checksum: "aa974d2511bec27582198a7917e7bedb4a374c46bc25edaa0de3c52635323c6e"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "b61472378fff8df844bd0dc6b5d9bdb407f9afa924816f65fbc59f7303711e60"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBSimulatorCodeInjection.xcframework.zip", checksum: "d69ee6f7ceb6b077a2f78a25ac8d80e93d994b7182e6cbb6115cddc9e2b738b4"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBSimulatorControl.xcframework.zip", checksum: "dacb96db5be534d4e7b12dc4cc09fbc6db4cde32751b2fe47e0af5cfe2ec5198"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBSimulatorProfiling.xcframework.zip", checksum: "be5ddc1c94ea22cbcaa7bbdd4e906a2de11fd8c6e3267918658197ffd8447477"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBSimulatorVideo.xcframework.zip", checksum: "65401dadf7ea25b18a69e882cec6739a4f00e87518819e445e88db5851c058a0"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBSimulatorXCTest.xcframework.zip", checksum: "0af2c4582cb1eacfadeabf9e385740d15e56152a293fd52e2b8c1ea17c7b3131"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBVideoCore.xcframework.zip", checksum: "6ac2ffec17d394595751a96a5bf66bda83c097fdc4a0218d6bcb41a4a718e4d9"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.0/FBXCTestCore.xcframework.zip", checksum: "5b0d61c7c974c2e7e8a79a361d666e4c208f410859823f697c0b50feee59917c"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.0/IDBConcurrency.xcframework.zip", checksum: "b68e035acbcee74a85cd3a9d723c30dc6564710d104162ffeaee3a13c7d86562"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.0/IDBPrivateHeaders.xcframework.zip", checksum: "53903c01463f47f31d2ac591aa4e7ee3e0c903d2c941dc7ce07e1b2fbd33db31"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.0/IDBTelemetry.xcframework.zip", checksum: "626e35bb2b7726d0d9901699aa656e13f72f14b95c37e5e9d763cf6d125c9167"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.0/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "a6888a23f751579b04273bef18521922a9191cd7f3904402c57c163e39ae36a0"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.0/ShimulatorProtocol.xcframework.zip", checksum: "70eae4db2e1423e1be74759c5ec69d1f3d7487de394bc5926e86daa49842e16a"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.0/SimScopeProtocol.xcframework.zip", checksum: "8ca8753728efa072d1f759892aaac7b4ab97197ad58a1d9ee72a34b4e02fd156"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.0/SimulatorIPC.xcframework.zip", checksum: "6a98b70368e7c538d9d764c16364f5c0991577ad373a6647ada742fd1ccc8479"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.0/ZstdDecompress.xcframework.zip", checksum: "283c026578309687ac1762adf1f6d50e868cbb58a7783022c80898675d512cc6"),
  ]
)
