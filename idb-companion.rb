# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.1.5.tar.gz"
  sha256 "8b647332de2874fc9e298d77915eadec5748a6d7daf10e2178fff92683b098dd"
  head "https://github.com/facebook/idb.git", branch: "main"

  depends_on :xcode => ["8.2", :build]
  depends_on "cocoapods" => ["1.10", :build]

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.1.5"
    sha256 cellar: :any, big_sur: "2beb957e46a0bbc683ec1f75090159797197cddfcea34f30415c2ebb63c838ad"
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

