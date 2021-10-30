# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class Fbsimctl < Formula
  desc "A Powerful Command Line for Managing iOS Simulators"
  homepage "https://github.com/facebook/FBSimulatorControl/fbsimctl/README.md"
  url "https://github.com/facebook/FBSimulatorControl/tarball/v0.4.0"
  sha256 "01c28ccfda0da1d0f6718916a615897479cb9e3ab9cf741e14868090117b4472"
  head "https://github.com/facebook/FBSimulatorControl.git"

  depends_on "carthage"
  depends_on :xcode => ["8.2", :build]

  def install
    system "./build.sh", "fbsimctl", "build", prefix
  end

  test do
    system "fbsimctl", "list"
  end
end
