# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.1.3.tar.gz"
  sha256 "4cefb5484baf108024c7287720923d796ccd490567a2dc1a3f489d66ac00e90e"
  head "https://github.com/facebook/idb.git"

  depends_on :xcode => ["8.2", :build]
  depends_on "cocoapods" => ["1.10", :build]
  depends_on "grpc" => "1.38.0"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.1.3"
    sha256 cellar: :any, big_sur: "a7b72a654177de1519165e079c3f057fbea69e9ed8b1a176952ce35ec75729b7"
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

