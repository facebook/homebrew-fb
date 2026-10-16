// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.6 by facebook/idb's .github/scripts/tap_formulae.py;
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
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.6/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "76bb2fe0fe52d9397ea0a99c78f0b94093382c92dc612a0e1ba09a9eea546599"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.6/CoreSimulatorStub.xcframework.zip", checksum: "fdff3d257f374009ca011a8d82ac20cfa59ca5ab33b6328eb038279b353325a7"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBArtifactStaging.xcframework.zip", checksum: "9cb44eac41fa6a50524586df2b166519a3f524b92eb01f4f6d0050ad42a0a2d2"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBControlCore.xcframework.zip", checksum: "29c1f483f528bace1d4179671413a8f62257456baf7c1981688b6e541772618d"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBControlCoreObjC.xcframework.zip", checksum: "d597f5c66217b6156abef93f3f4a3aadb9e25cd62c88354b76b30f2c12cce2ca"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBDeviceControl.xcframework.zip", checksum: "79c2f81e5c71506fa3ebef0dd34dcaedfcccec44643fe7e4dfea20c7e03a8dd1"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBProfilingCore.xcframework.zip", checksum: "0e9691bc3d45c600c9121b7c8b02716777b4ddbdc395b6643ae50e325cb97c26"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorAX.xcframework.zip", checksum: "7867171fd6812f43867879861ac6dba488b84c80e0fb6893a8b77911e08d6757"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "31a40d97d72c55cc0a4bd3baf180481cb8aa7c6383c94202dd72a686f0fd287a"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorCodeInjection.xcframework.zip", checksum: "1e7b9f79aed1c68de0ed04b7e552010b70ec149b9a0e928803d9491a0848703c"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorControl.xcframework.zip", checksum: "1e1a22db29983dbc389e62b086946cac94b93b1cdd01c49dc34eed1329aa3eb7"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorProfiling.xcframework.zip", checksum: "d78ab44bcad4dfc1b74d2328021cbb5f70fa7ae6226601fed6abc7944cdea7a0"),
    .binaryTarget(name: "FBSimulatorServices", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorServices.xcframework.zip", checksum: "58148470c97954f0ed074403c20b2064ec3eb69ff85fc790d1ec554b861660fb"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorVideo.xcframework.zip", checksum: "a87e22d8ee22494da11ccaf84f1e9f0bf2b3a37d143be4584a239c9caaf0b29e"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBSimulatorXCTest.xcframework.zip", checksum: "2e8709770e570dfb8e7286b697f4e015622581b3601f0c628d11b86b898d78df"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBVideoCore.xcframework.zip", checksum: "1e281b14ed3e2c83e052a71edf138d9abde05c1f73c87e1d7484357f6af39c8c"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.6/FBXCTestCore.xcframework.zip", checksum: "84cc14d36d143a94fa5369222ae7f9dbb2f75bc2cf85bbb9ec6e788fa2b4a567"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.6/IDBConcurrency.xcframework.zip", checksum: "eed66f05641410dc35b113969ca643120217bb1cab17321cf7246697ec225afe"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.6/IDBPrivateHeaders.xcframework.zip", checksum: "f0ef25193330838bb049bf1af2f2788bc4750f4589076337c73f3192a4684876"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.6/IDBTelemetry.xcframework.zip", checksum: "fb6d9d3824e1108c0532c0742a038489f0200c595d03e72975820734ba24cf86"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.6/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "92e68020f50407c5d451f21cf877c96a1b0b1451f6fd79388e2a1baaa233838f"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.6/ShimulatorProtocol.xcframework.zip", checksum: "0ddc0f6a2d02ff6ab8d8c6b66125fee2e29d715ea69d8eb5005aa020f37431c6"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.6/SimScopeProtocol.xcframework.zip", checksum: "72cd0cf464ea8205fcf8b1652423e3f4ac92c2163562f159c6da79c3cb9fd65e"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.6/SimulatorIPC.xcframework.zip", checksum: "819008698d296584da8acdd87e516d7d94d58d7d496b6ac5740abbeb7dc8ccea"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.6/ZstdDecompress.xcframework.zip", checksum: "9f94f88fce45f45e6164a897e591ef8192bccc1f25ced2768eab426bd8c493b8"),
  ]
)
