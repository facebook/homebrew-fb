# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.1.6.tar.gz"
  sha256 "000cbfe92cfafac89950e32a513d4e165cf8563945900fc34660b82f69912858"
  head "https://github.com/facebook/idb.git", branch: "main"

  depends_on :xcode => ["8.2", :build]
  depends_on "cocoapods" => ["1.10", :build]

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.1.6"
    sha256 cellar: :any, monterey: "4b47f89692307eb46f941fa3f0a325efe640807441053cd62e2d8b62fe528f96"
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

