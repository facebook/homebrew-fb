// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.5 by facebook/idb's .github/scripts/tap_formulae.py;
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
    .library(name: "FBSimulatorAX", targets: ["AccessibilityPlatformTranslationStub", "CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorAX", "FBControlCore", "FBSimulatorBridgeProtocol", "FBSimulatorControl", "FBSimulatorServices", "FBControlCoreObjC", "SimulatorIPC"]),
    .library(name: "FBSimulatorBridgeProtocol", targets: ["FBSimulatorBridgeProtocol"]),
    .library(name: "FBSimulatorCodeInjection", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorCodeInjection", "ShimulatorProtocol", "SimulatorIPC", "FBControlCore", "FBSimulatorControl", "FBSimulatorServices", "FBSimulatorXCTest", "FBXCTestCore", "ShimulatorAudioInjectionCore", "FBControlCoreObjC", "FBSimulatorBridgeProtocol"]),
    .library(name: "FBSimulatorControl", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorControl", "FBControlCore", "FBSimulatorBridgeProtocol", "SimulatorIPC", "FBControlCoreObjC"]),
    .library(name: "FBSimulatorProfiling", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorProfiling", "FBControlCore", "FBProfilingCore", "FBSimulatorControl", "FBControlCoreObjC", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
    .library(name: "FBSimulatorServices", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorServices", "FBControlCore", "FBSimulatorBridgeProtocol", "FBSimulatorControl", "SimulatorIPC", "FBControlCoreObjC"]),
    .library(name: "FBSimulatorVideo", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorVideo", "FBControlCore", "FBSimulatorControl", "FBVideoCore", "FBControlCoreObjC", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
    .library(name: "FBSimulatorXCTest", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorXCTest", "FBControlCore", "FBSimulatorControl", "FBXCTestCore", "FBControlCoreObjC", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
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
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.5/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "19f40dc2118bcb1b5683b3faa7315d3888d5f5fec0cb0e36fb9a2ee8155dee32"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.5/CoreSimulatorStub.xcframework.zip", checksum: "272a7abe96a1f0b8d799dac237bf1d2326eb20cfc3b806c3c637adb3b26a9302"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBArtifactStaging.xcframework.zip", checksum: "e5c28a847fd8b74374934bfc469eb5b3819009a7b50c2b24223c69c1a2a16c85"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBControlCore.xcframework.zip", checksum: "8dae48d8e39c9ae2e39b2e03897b82831d70763d8e6d0a6f4189b189294f95ae"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBControlCoreObjC.xcframework.zip", checksum: "f946705a5f9d66d1bee23513f18424362f18f9659ad31c71bc3fe3e37e524280"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBDeviceControl.xcframework.zip", checksum: "dcc155e963aa297305c492941505cad038ebe84fc86feb80c3e2246548a493db"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBProfilingCore.xcframework.zip", checksum: "30068c29d25148bac09029f85c6ab6736e45214d7b251a17d7c12e6bcd1d359e"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorAX.xcframework.zip", checksum: "db61a842e97938bf8db361013333b1e952bd3968ff870f2b7597f9ab6615c0d8"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "52e486bddbf415e6ffaf12ab94c5ca6128f413cd3e48284394d973b400ae3fa2"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorCodeInjection.xcframework.zip", checksum: "9e40e1b7a84ed5c4a9a1d62f152f44e72a92f8d121554567889dfa3a4ac6eb28"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorControl.xcframework.zip", checksum: "ffcb1946f2c88713ef23eb0d21a135c20219ac36b8f12aafae79e68e3f8d0a50"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorProfiling.xcframework.zip", checksum: "335b541e22466ca73e5f748241179ebe7a7679c7bd06b4dab6f168f71e7fef46"),
    .binaryTarget(name: "FBSimulatorServices", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorServices.xcframework.zip", checksum: "920d1089297647cca93cbae36aa67ac55760908789d2c3cd2a6dc5d5ab13b5a5"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorVideo.xcframework.zip", checksum: "144098a33085fb78d32b01172ba499ed2019100abcf5ef1f1f589e6ec88f3407"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBSimulatorXCTest.xcframework.zip", checksum: "09606e82679176aade975049642fa7665473cfdfb1e9bc6375536624e360f744"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBVideoCore.xcframework.zip", checksum: "56a6eb4118b7c0e3cdee9dd8b16d6726505ea3ce951617c88d53914929eee7ae"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.5/FBXCTestCore.xcframework.zip", checksum: "91d487e36f50192924fe170921de1a3b1209677aa0cc5d926678c3be716fa16c"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.5/IDBConcurrency.xcframework.zip", checksum: "f22bc3115a2d02c7f67530c1e2b7527456e426350318a23b7ece3850f279cc1d"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.5/IDBPrivateHeaders.xcframework.zip", checksum: "688234efc5250ab648f74395b94594135c425a9808597dab1918fecb70816016"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.5/IDBTelemetry.xcframework.zip", checksum: "8015d26136b82224245d411440d9f0b7b9d6d2bb6f0e9e564209db3325d7dbef"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.5/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "52b6e11d99bdb99df192a74fce45fb8b69d2daf656702103ae62c390f3c1dc10"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.5/ShimulatorProtocol.xcframework.zip", checksum: "30e6c84f365e012ed9cf526e4d143e99ed6d34ec9327822d5002c57184853962"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.5/SimScopeProtocol.xcframework.zip", checksum: "db471087903e2d04a3426121b5b465e4043d604c01b6f53a3191a3b591c7f9e0"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.5/SimulatorIPC.xcframework.zip", checksum: "38aba95b6b04c62612002a6097cd1ff4fd1bcd2b88358924ff68d7a92c37fe7f"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.5/ZstdDecompress.xcframework.zip", checksum: "9beae17cc08fa54c251dcba1470fe6fa9bf806a2105c46aebfe87fd72dd99b73"),
  ]
)
