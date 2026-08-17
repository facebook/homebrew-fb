# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "Companion server for automating iOS Simulators"
  homepage "https://fbidb.io"
  url "https://github.com/facebook/idb/releases/download/v1.5.0.b2/idb-companion.universal.tar.gz"
  # Set explicitly: Homebrew infers "1.5.0" from the URL and silently drops the
  # ".b2" prerelease suffix, which would make a beta look like a final release.
  version "1.5.0.b2"
  sha256 "54e7822be800dd531d9401cad73019e6e945a1e10b90f39ef12913bec197f061"
  license "MIT"
  head "https://github.com/facebook/idb.git", branch: "main"

  # Both are runtime requirements, not build ones: the companion loads
  # CoreSimulator and MobileDevice from the selected developer directory, and
  # the shipped binaries carry a macOS 15 minimum (LC_BUILD_VERSION minos 15.0,
  # built against the 26.5 SDK).
  depends_on macos: :sequoia
  depends_on xcode: "26.0"

  def install
    # v1.5.0 ships a flat tree: idb_companion, idb-repl, Resources/ and the
    # SwiftPM resource bundles all sit at the archive root. v1.1.8 nested
    # everything under a wrapper directory holding bin/ and Frameworks/.
    #
    # idb_companion resolves Resources/ as a sibling of its own binary and
    # crashes outright when the shims are absent, so keep the tree intact in
    # libexec and symlink the executables rather than cherry-picking them.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"idb_companion"
    bin.install_symlink libexec/"idb-repl"
  end

  test do
    # Both bin entries must resolve back into libexec, alongside Resources/.
    # Assert the layout directly: --help and --list succeed even on a tree with
    # Resources/ deleted, so neither proves the install block is right.
    %w[idb_companion idb-repl].each do |exe|
      assert_equal (libexec/exe).realpath, (bin/exe).realpath
    end

    resources = libexec/"Resources"
    assert_path_exists resources/"libShimulator-iOS.dylib"
    assert_path_exists resources/"libRepl-iOS.dylib"
    assert_path_exists resources/"SimulatorFrameworkBridge"
    assert_path_exists resources/"ReplHost.app"
    assert_path_exists resources/"IDBAPI.swiftinterface"

    assert_match "build_date", shell_output("#{bin}/idb_companion --version")
    assert_match "idb-repl built at", shell_output("#{bin}/idb-repl --version")
  end
end
