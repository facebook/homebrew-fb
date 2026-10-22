// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.7 by facebook/idb's .github/scripts/tap_formulae.py;
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
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.7/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "e0eef89adcbb95cb1f468c8dd585f7190f748f05dbc0bac93b30e7ca69097aca"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.7/CoreSimulatorStub.xcframework.zip", checksum: "f1dd05619b6357b765830477879e49b7314af74e6043adc4bfffcc507a72a996"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBArtifactStaging.xcframework.zip", checksum: "77d388a049d46b8a13c6d15283db9351b1b21d954e9e817e1017dd12650f55be"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBControlCore.xcframework.zip", checksum: "887a26ab93c9f54cddd6c32f21b8cc5586f1396644759706036c02653af47903"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBControlCoreObjC.xcframework.zip", checksum: "8f2f37fd6a74b98f516aabf4c27881a81e44831a0fa7f01895cced10de2469d9"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBDeviceControl.xcframework.zip", checksum: "45a78cb13a6591c830dd7e877f62bab01598bdef0e3f18672ba3c76df481f6e1"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBProfilingCore.xcframework.zip", checksum: "f5ca925558dcf2435c41f2e0dfac3d99cda341bab950cdc564c616389ea85acb"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorAX.xcframework.zip", checksum: "1331b557dc775847a4e46522b1bfb0b393181a28646621a3271169c06f2829eb"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "150761f6905edc5aa56783931f0006f9d43c844b94d0a424db2cd5b83de22fe7"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorCodeInjection.xcframework.zip", checksum: "4bed6aafefce7d88b5af61c9cbb7037d8f71a7bcaacf5234a00aa16e1d725c85"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorControl.xcframework.zip", checksum: "b2c88f22ca55b3da252d8a7e33a98be911347a2d78bd429038c38ecbf48f3077"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorProfiling.xcframework.zip", checksum: "1ee0bae0d9bfef8548f262ea022dbf2ff901cc150aae0913af0b49977d8f53e3"),
    .binaryTarget(name: "FBSimulatorServices", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorServices.xcframework.zip", checksum: "e97f47bd119f639c4bd3c86fe38ac1989c0bd47f00e035d9a5f07d8996117608"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorVideo.xcframework.zip", checksum: "2d2192f643df50426edb4bce5e17302e2fdb489df288780e4892a5da354edf7f"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBSimulatorXCTest.xcframework.zip", checksum: "ff51cb4b7a4231655671c7aaff07fd7c05227cfe76cfce661c4274d9a1d032e3"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBVideoCore.xcframework.zip", checksum: "df4986fbd61147ccb6afdc8a158c69c013a9b6fea7696f5a51ae43ba05a0969e"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.7/FBXCTestCore.xcframework.zip", checksum: "6c36cd0b9deaed18de4ddeb6c4d6a3d7f980e044432a474aeb2aa1e589c78c1d"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.7/IDBConcurrency.xcframework.zip", checksum: "8feabf17d023307e6fa0870cab6b73b46640644467efb4868e5c4ccc17be2626"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.7/IDBPrivateHeaders.xcframework.zip", checksum: "eb78edff346bc38b7392a5243235c6d42827b7036371dc8a5e166fa6ee3b9461"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.7/IDBTelemetry.xcframework.zip", checksum: "58d560ea151941b7522ad265143bfc7318501a2306600880b13bafcf96836481"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.7/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "1ac92df88d29b0547644638adba935f1632a7d59d9eaf7778717c1171f661e70"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.7/ShimulatorProtocol.xcframework.zip", checksum: "ac6b8c5d8c4fd6ba67a3c3720a5e58257b99124f5a969cd2adf5604a08dd65e7"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.7/SimScopeProtocol.xcframework.zip", checksum: "94f88098051ac461810012ce9cd14bc53c7b279cec80750eac7f537864aef1b1"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.7/SimulatorIPC.xcframework.zip", checksum: "4419875068465239711bcf296578a7259f6fa9db00c5dfadb5e31a57a99b2ab7"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.7/ZstdDecompress.xcframework.zip", checksum: "887bc49bd845e80d5e5b34a86d62a0c8601779fe907d4bdcc793db59e9c4f31d"),
  ]
)
