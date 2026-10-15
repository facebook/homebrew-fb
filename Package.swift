// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.2 by facebook/idb's .github/scripts/tap_formulae.py;
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
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.2/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "45d6f45dee81937131752b81932e8ea8af959468b7d5a6fac84ed58987568044"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.2/CoreSimulatorStub.xcframework.zip", checksum: "2109a5cbeb7a0358db4bdace0b605b0c36fb92ece202e5ab241888f41f588723"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBArtifactStaging.xcframework.zip", checksum: "94f9758aa72309714a09c6f3f200f9fd71169ed4cf7386c4cc64bca44dfcd04d"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBControlCore.xcframework.zip", checksum: "a59b3d12fd2547cc00d8248ca61fc91c67f91b1a194e60469cd7a7276c0eca57"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBControlCoreObjC.xcframework.zip", checksum: "75258842df05e3c32aa5e0c522bb0af5f6b8c46e803c9e14f1cc524dc800b482"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBDeviceControl.xcframework.zip", checksum: "87577913712040281ac996e50f8abf54299d81b65f1185afbf203cfe5919d193"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBProfilingCore.xcframework.zip", checksum: "7c3c00190e933ea2517796c9af877a4ffab08e06e37445620b5f55d17009fe46"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBSimulatorAX.xcframework.zip", checksum: "5ce21be98d15f9f2391b3096431437f3d0a06237ed5bfeb6ba2e18d9890fe6b9"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "e09f889c64b210fc1e137945f60ad73e88719859a6cba87897fc3b34eebe986c"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBSimulatorCodeInjection.xcframework.zip", checksum: "3442471cdc3bdf0b3782f4bd875daaa9e6f07ded712b90fd60d64644a770fa59"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBSimulatorControl.xcframework.zip", checksum: "a8b0b7d57bb382fd1a01bf44765fddd5ca4aa30348c921e17d9a869e7fff159d"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBSimulatorProfiling.xcframework.zip", checksum: "fcefedd5719282ac2ceb6a57bfd85fbc07180b4d0a69d340e5892ad1849f6f26"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBSimulatorVideo.xcframework.zip", checksum: "d68f62058305ab5c02a0d3274186e7db989255f64cfea2432b0669dd40f43361"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBSimulatorXCTest.xcframework.zip", checksum: "402965d81240390ffef9bcaad52d255cca9f6e125aef13a108495680b7026b55"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBVideoCore.xcframework.zip", checksum: "b09a33fbd702c54d3144b15420bec3ede8e90c0297c90e68c2b2dbaafd1d029c"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.2/FBXCTestCore.xcframework.zip", checksum: "3b3281193982886a4aba192f092b96b8d89b066081c059f9b86348cda225279f"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.2/IDBConcurrency.xcframework.zip", checksum: "f8c661f0e799f4e25dcb866eb47d92f2161f399163b4a43c750f3a2922bfe4c4"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.2/IDBPrivateHeaders.xcframework.zip", checksum: "ef309bea07611e428d8224ce3db43ff177e8cc4fde93d491a10a73cd5f8d6167"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.2/IDBTelemetry.xcframework.zip", checksum: "728b3f73668f1c93d45a4496bb34adef7938b4edf14effdc0c905130c7ce00e4"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.2/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "74f98f79d4cd1d9fe488f96fedcd899d6021a637057968b521d4d0c1656a2cd8"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.2/ShimulatorProtocol.xcframework.zip", checksum: "f0c39f71bc05d77b0834f29540334088813110ac95986c7b38986c0ab9179775"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.2/SimScopeProtocol.xcframework.zip", checksum: "ad9f488613f4cd2cb98535f5d5dfa43812ec8d641fd412fbc8014239ccc30a61"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.2/SimulatorIPC.xcframework.zip", checksum: "3a5b2f28194f861ea29df101500d875ac8365bcd56d8d2f4282f63e1996f29d4"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.2/ZstdDecompress.xcframework.zip", checksum: "a504fd794af9f3acb31ee0ef3fd1f500a7194c71259c6496d37cc90b88f3b2da"),
  ]
)
