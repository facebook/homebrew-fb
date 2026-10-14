// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.1 by facebook/idb's .github/scripts/tap_formulae.py;
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
    .library(name: "FBSimulatorAX", targets: ["AccessibilityPlatformTranslationStub", "CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorAX", "FBSimulatorBridgeProtocol", "FBControlCore", "FBSimulatorControl", "FBControlCoreObjC", "SimulatorIPC"]),
    .library(name: "FBSimulatorBridgeProtocol", targets: ["FBSimulatorBridgeProtocol"]),
    .library(name: "FBSimulatorCodeInjection", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorCodeInjection", "ShimulatorProtocol", "SimulatorIPC", "FBControlCore", "FBSimulatorControl", "FBSimulatorXCTest", "FBXCTestCore", "ShimulatorAudioInjectionCore", "FBControlCoreObjC", "FBSimulatorBridgeProtocol"]),
    .library(name: "FBSimulatorControl", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorControl", "FBControlCore", "FBSimulatorBridgeProtocol", "SimulatorIPC", "FBControlCoreObjC"]),
    .library(name: "FBSimulatorProfiling", targets: ["CoreSimulatorStub", "IDBPrivateHeaders", "FBSimulatorProfiling", "FBControlCore", "FBProfilingCore", "FBSimulatorControl", "FBControlCoreObjC", "FBSimulatorBridgeProtocol", "SimulatorIPC"]),
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
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.1/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "77754ce4f36cf229e67bc2338f2466c78089c264d56dae85dfa69f3aa5f90578"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.1/CoreSimulatorStub.xcframework.zip", checksum: "86fd21a9cac4719ba8747622c47a8a2fad3d4301955dad9d6f217528f14757d5"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBArtifactStaging.xcframework.zip", checksum: "ad704b94c03b976f23d6d23e12e5a5707b683d3c89ac3cfc6ac4995eb6ed6599"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBControlCore.xcframework.zip", checksum: "7b402f6e2218504d335c97dbf2115828d2ceee9b544f3adc6bc804027b69ef74"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBControlCoreObjC.xcframework.zip", checksum: "0461444d2800f2818f222735aea9a6ac5a3aa137cdab0302e4cdfe7978f6d614"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBDeviceControl.xcframework.zip", checksum: "9196205cf069d6ffda42a55ac4124ad488da4b9f80642052d7308a7499e41781"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBProfilingCore.xcframework.zip", checksum: "28e55561071cd8c390e509e13b94fce11297c4131a8621cfae89922507f2b76b"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBSimulatorAX.xcframework.zip", checksum: "8d818bcb59852643f3f6060280dddb7b9f08b37b3e8932bbebb11336c94be616"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "0f01911028b9cbb78c2f6d58d26e13319c28c4b969ed5bcb78dc94df1713758e"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBSimulatorCodeInjection.xcframework.zip", checksum: "1cac6235278a8fced0d67a21b71d4a23abbf1c9cf807ec788c985f7eb0d5cc4d"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBSimulatorControl.xcframework.zip", checksum: "2f7d7ce8340fcaa3550e461fb74667b7c84e2a7a288c5152c305ada7aad8b745"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBSimulatorProfiling.xcframework.zip", checksum: "be32eb3ac889f665678a986836a90e90768c9b469e3812eb48ce09af21a909b9"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBSimulatorVideo.xcframework.zip", checksum: "3bb82d50901717c85dbcb44cd85dfabe31669aee47ad036cf9d458bc6e978db2"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBSimulatorXCTest.xcframework.zip", checksum: "df908832e7084f982a414788814409a2de4a69be92df28cd8ea490163a3c1c42"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBVideoCore.xcframework.zip", checksum: "ad3b87bbaeb5c478d6675012240c9c1d9317a4a9c72e3ce7b167440e4a5bdbff"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.1/FBXCTestCore.xcframework.zip", checksum: "64cc3f3fd2a240cef42bb5654fa667eea190a883171180a264634fcf67720dbc"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.1/IDBConcurrency.xcframework.zip", checksum: "8c13a6cfd0ecbef4c8d037df010294b0aa0428b3202c8d7da63575591a91b2a0"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.1/IDBPrivateHeaders.xcframework.zip", checksum: "75e5f0c2ea919037304e634e1b7aae6eb0dd11b2e6555f5eca0c97c5031706e0"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.1/IDBTelemetry.xcframework.zip", checksum: "e9e062238c6312e557f019ffc3f26bf33b18390d8a6ed043c9d12be9b80992ce"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.1/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "601b3a7117507a6efd9d4ad1df2faf1a3c93cd50497249c4a2ac48e4642e7b00"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.1/ShimulatorProtocol.xcframework.zip", checksum: "b6510c6c783730ff751b1594b6f67df77b20821506c98c4b56428ec968bfc908"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.1/SimScopeProtocol.xcframework.zip", checksum: "565821eee4969d6af34e5a00280d85b173563bc4f816c476ea2688034cc2c990"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.1/SimulatorIPC.xcframework.zip", checksum: "2e2c06ed120bc9a5662eb93584ae4fbe1d96257231207a273357cee96fdbbd6e"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.1/ZstdDecompress.xcframework.zip", checksum: "dea748fd85b86c8c0fc34e7c3c1973a3aa2c2436ee3db59f8d4b4724f18e8265"),
  ]
)
