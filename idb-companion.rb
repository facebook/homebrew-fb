# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/releases/download/v1.1.8/idb-companion.universal.tar.gz"
  sha256 "3b72cc6a9a5b1a22a188205a84090d3a294347a846180efd755cf1a3c848e3e7"
  head "https://github.com/facebook/idb.git", branch: "main"

  depends_on :xcode => ["13.0", :build]

  def install
    bin.install "bin/idb_companion"
    frameworks.install Dir["Frameworks/*"]
  end

  def post_install
    Dir
      .glob("#{prefix}/Frameworks/**/*.dsym")
      .each do |shim|
        system "codesign", "--force", "--sign", "-", "--timestamp=none", shim
    end
  end

end
