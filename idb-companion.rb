# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.1.2.tar.gz"
  sha256 "fe52b96f22be6aa6161c1a0e09c04f34f9b5207c49cc0eb16b3e0b3c03744e42"
  head "https://github.com/facebook/idb.git"

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.29.1"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.1.2"
    sha256 cellar: :any, big_sur: "50d8dfdda62d984d50f6f095674725861224b70470bf2bc65fdcdd540b1533bb"
  end

  def install
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

