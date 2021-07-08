# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.1.4.tar.gz"
  sha256 "aa3556dfa0971ddf4aefe6d95712a6805974a6d4fbb3b25f15d7bfaf22654f2b"
  head "https://github.com/facebook/idb.git"

  depends_on :xcode => ["8.2", :build]
  depends_on "cocoapods" => ["1.10", :build]
  depends_on "grpc" => "1.38.1"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.1.4"
    sha256 cellar: :any, big_sur: "1559d18a465a7831401536101796582d0b841b8be87451a5ce916cab436ffe49"
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
    ].each do |shim|
      system "codesign", "--force", "--sign", "-", "--timestamp=none", shim
    end
  end

end

