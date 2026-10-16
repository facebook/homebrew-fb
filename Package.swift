// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.4 by facebook/idb's .github/scripts/tap_formulae.py;
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
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.4/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "ede5df593d4bf961b75e7326ced860f1545564b1754b1692845bdb5d95ea7943"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.4/CoreSimulatorStub.xcframework.zip", checksum: "8b0ac14638e5ea9cd0b7b02f0719d950b0bf27e4b1bfffc1ccfd6d0fc1b38464"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBArtifactStaging.xcframework.zip", checksum: "3817820d7cd2579c8c707324f3e10a64573d76de044915d4bbe10c24641f6b02"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBControlCore.xcframework.zip", checksum: "b8e6ed57520e0e0ab1cbbdf414675c79653fa4ffa69c265c422cce560ab18ef7"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBControlCoreObjC.xcframework.zip", checksum: "5a1c0c5734eba74770682dfe450b4ed13971b6a2f2c6420dca73eab1c8f623bf"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBDeviceControl.xcframework.zip", checksum: "aa5cabc6ca54e2784fd02b690b425d354ab36ff91eb809718af2970531b843b6"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBProfilingCore.xcframework.zip", checksum: "bceabd35006d06cfba4a61ef8d33982406a007dad6e3335b43954f097957e81e"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorAX.xcframework.zip", checksum: "bd6ee5075fa884988a611d9f649cde2bcdc8536fd5262845c5ce16aea04a254b"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "caa3c54421cb348b4a983f35a747ce7915bd600d694a468b8d8b9f0e905f6088"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorCodeInjection.xcframework.zip", checksum: "6fde7d14651cdc1da7cac1f9a6937d5ab0c6cab60f7d12ba5b44a4b86f771f65"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorControl.xcframework.zip", checksum: "78456dfa4b146a01cfe507b9bba8333e8df812a05a7094524675b138393d6f56"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorProfiling.xcframework.zip", checksum: "ad73b3fa33dc66e254bc20d8a02ccbf2136f77217f2daf9c6e12e10777cdca38"),
    .binaryTarget(name: "FBSimulatorServices", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorServices.xcframework.zip", checksum: "66dc52e3dcd866dfa54755d41174549b73b94ecb3d1f2eadedc495d361d9c274"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorVideo.xcframework.zip", checksum: "61322f0be33bb72d2805b357f136fd3618d7d009f2e585774aa41f34501578d0"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBSimulatorXCTest.xcframework.zip", checksum: "4c6c2be6d12068b83481fe3de026a265dbc276f6087b2be5767f1ff044eae1e2"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBVideoCore.xcframework.zip", checksum: "d3de5e460b3a4cfcdf1df1a02de76b131d06a7a81a18cb3d6025f53c0a03ff07"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.4/FBXCTestCore.xcframework.zip", checksum: "f2673de3ba218caaa4811b520ad8bb4e727a4bc39a4e3288a4093e2f8b5efaf9"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.4/IDBConcurrency.xcframework.zip", checksum: "45d538137f0f89538f12b2a7da6cc684c63c410990045799065a3b7cef1c3352"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.4/IDBPrivateHeaders.xcframework.zip", checksum: "aa9dbb52e032c095b92989fc561516b924ed5e651ec713b57d768f26500e4059"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.4/IDBTelemetry.xcframework.zip", checksum: "d51d81c5fde41ec2e28c495f2a1173c85a73a619f8c23f20672dd14f89cb5359"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.4/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "da0fd1e25940831174a065bedae0ac5ec259938c80c738ddf5cb677e14a6e848"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.4/ShimulatorProtocol.xcframework.zip", checksum: "ce11b06ace39f319ffaa6edfc05ae33bf3b01dc2a3cbb943e2e0c3aea77b17ce"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.4/SimScopeProtocol.xcframework.zip", checksum: "cc7ae1c3af152cfee43f91f9933938cbe17a367d5f9b8f0cf537db7365b6a445"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.4/SimulatorIPC.xcframework.zip", checksum: "c24cf687030c081bda6244ac5758f60e48507fe388e296fe08eea3065cc1ee6e"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.4/ZstdDecompress.xcframework.zip", checksum: "30a13bb6414385c591622f94f56b423c4e714b42e446777c76c5a546a7f87583"),
  ]
)
