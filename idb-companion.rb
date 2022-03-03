# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.1.7.tar.gz"
  sha256 "4eee66cb91ba0e8d9e075ba0354eedda85f20694b41f1bf4264fb491a28d511d"
  head "https://github.com/facebook/idb.git", branch: "main"

  depends_on :xcode => ["8.2", :build]
  depends_on "cocoapods" => ["1.10", :build]
  depends_on "grpc" => "1.44.0"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.1.7"
    sha256 cellar: :any, arm64_monterey: "386fc014e107b4530b584d5e1f4ff0edec5cf408b973949c97f51f1966f1671c"
    sha256 cellar: :any, monterey: "100c27abd8e959b5561bb8ae0425d61088ed9c07bd44c95ad5b70b4f601b79e3"
  end

  def install
    system "pod", "install"
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

  def post_install
    [
      prefix/'Frameworks/FBDeviceControl.framework/Versions/A/Resources/libShimulator.dylib',
      prefix/'Frameworks/FBSimulatorControl.framework/Versions/A/Resources/libShimulator.dylib',
      prefix/'Frameworks/XCTestBootstrap.framework/Versions/A/Resources/libShimulator.dylib',
      prefix/'Frameworks/FBControlCore.framework/Versions/A/Resources/libShimulator.dylib',
    ].each do |shim|
      system "codesign", "--force", "--sign", "-", "--timestamp=none", shim
    end
  end

end
