// swift-tools-version:6.0
/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree.
 */

// Rendered for v1.7.3 by facebook/idb's .github/scripts/tap_formulae.py;
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
    .binaryTarget(name: "AccessibilityPlatformTranslationStub", url: "https://github.com/facebook/idb/releases/download/v1.7.3/AccessibilityPlatformTranslationStub.xcframework.zip", checksum: "60c4844f496a2468043bf69048c049f873160352a05acb8ec89cc54f374189d7"),
    .binaryTarget(name: "CoreSimulatorStub", url: "https://github.com/facebook/idb/releases/download/v1.7.3/CoreSimulatorStub.xcframework.zip", checksum: "af4fa8fc07fb6075f9406486f7201998485e53cab0ccae75e2a0f58e00413bd8"),
    .binaryTarget(name: "FBArtifactStaging", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBArtifactStaging.xcframework.zip", checksum: "f4a037283068e28256956c4a9a0d4429575a4848206234f3cbfc65d0d7f09f74"),
    .binaryTarget(name: "FBControlCore", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBControlCore.xcframework.zip", checksum: "d1f64307213cd4d4cd5254f18114e39de2dbaf4c26b267b2da04d1f15e4a3cce"),
    .binaryTarget(name: "FBControlCoreObjC", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBControlCoreObjC.xcframework.zip", checksum: "63f3b5b1d5b098adc3551e5107a211288e0ddb70cc8d10fa2c44733b57063bb3"),
    .binaryTarget(name: "FBDeviceControl", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBDeviceControl.xcframework.zip", checksum: "64fd0d0f8c77587ceaa299def8e1f5bd976bb95c21c2f090907a6b52f41905ab"),
    .binaryTarget(name: "FBProfilingCore", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBProfilingCore.xcframework.zip", checksum: "c069b934721d4451dffcac12b281f4d2040f3075536c41d447c9207c9b4b052b"),
    .binaryTarget(name: "FBSimulatorAX", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBSimulatorAX.xcframework.zip", checksum: "06ee8bc1a8850cef6d5884f7be770e56f6a3362add91a929630716e0d639bba9"),
    .binaryTarget(name: "FBSimulatorBridgeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBSimulatorBridgeProtocol.xcframework.zip", checksum: "8fe0297b0002f7cfcb8c6f41e80b3172d18670f287fe1d37ae4b117ee0dbd23e"),
    .binaryTarget(name: "FBSimulatorCodeInjection", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBSimulatorCodeInjection.xcframework.zip", checksum: "4d6b53d09b68b8f2bec7265ab044f357313c2e2c6fb54f82bde9728ab4be1939"),
    .binaryTarget(name: "FBSimulatorControl", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBSimulatorControl.xcframework.zip", checksum: "683ed982b71cf82d8ff2d016f63a30864ae3c36affcebffbd6acd7ad9c6342af"),
    .binaryTarget(name: "FBSimulatorProfiling", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBSimulatorProfiling.xcframework.zip", checksum: "4f73820ad9e083826c314e3493338ac217dc82b8e28e4fb4d0a033532008f4f3"),
    .binaryTarget(name: "FBSimulatorVideo", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBSimulatorVideo.xcframework.zip", checksum: "7b1cb6d09985edd234c2f045d4370f9060303b01df573d24cb931d32e57886ee"),
    .binaryTarget(name: "FBSimulatorXCTest", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBSimulatorXCTest.xcframework.zip", checksum: "f4daff8e5099acba476e8bca2f4b50e5097f0635298803d700a7f0b1b041181d"),
    .binaryTarget(name: "FBVideoCore", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBVideoCore.xcframework.zip", checksum: "5382c4fc2e4444f8c521baafcbf91a8b2df6dc2b39654f014011ac6cef27c108"),
    .binaryTarget(name: "FBXCTestCore", url: "https://github.com/facebook/idb/releases/download/v1.7.3/FBXCTestCore.xcframework.zip", checksum: "85ccba0ae07a545ddd50e90673acff477d67458cf406cf478c2025e8e0ba4cc4"),
    .binaryTarget(name: "IDBConcurrency", url: "https://github.com/facebook/idb/releases/download/v1.7.3/IDBConcurrency.xcframework.zip", checksum: "e340dffa868cb39038a6c64d8647fcf5050210983a01d5ef12ad929658023786"),
    .binaryTarget(name: "IDBPrivateHeaders", url: "https://github.com/facebook/idb/releases/download/v1.7.3/IDBPrivateHeaders.xcframework.zip", checksum: "95c889e63c805b0dfddfd5dabc7976b3eca54223677c63660c95ae5bc73110f1"),
    .binaryTarget(name: "IDBTelemetry", url: "https://github.com/facebook/idb/releases/download/v1.7.3/IDBTelemetry.xcframework.zip", checksum: "18bf21a5293d24fa00bb6d696e784598090d3f7c24d83b827dc3475d52f5fb74"),
    .binaryTarget(name: "ShimulatorAudioInjectionCore", url: "https://github.com/facebook/idb/releases/download/v1.7.3/ShimulatorAudioInjectionCore.xcframework.zip", checksum: "5e8318887e0086eadc1ab33f0823339cf33b9fcb81c019200dc88187b1999330"),
    .binaryTarget(name: "ShimulatorProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.3/ShimulatorProtocol.xcframework.zip", checksum: "c24e44d564fc9b19bbce79b54f39bac40ed2abaf06a1f8dd25dc929f69922bf2"),
    .binaryTarget(name: "SimScopeProtocol", url: "https://github.com/facebook/idb/releases/download/v1.7.3/SimScopeProtocol.xcframework.zip", checksum: "7ecdc99a56223e8c1a7c20cad0ba4dfe0bd5a1a3585da4cda62a85fb99da2555"),
    .binaryTarget(name: "SimulatorIPC", url: "https://github.com/facebook/idb/releases/download/v1.7.3/SimulatorIPC.xcframework.zip", checksum: "b6f0d06b081c247e06f1924db230dbab4b49e021de30457732a88206643d23b1"),
    .binaryTarget(name: "ZstdDecompress", url: "https://github.com/facebook/idb/releases/download/v1.7.3/ZstdDecompress.xcframework.zip", checksum: "64c0e3d3a73a6ed1de7a301cb67096445b126b07771bc0d52ae356d6c897aea2"),
  ]
)
