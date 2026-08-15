# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "Companion server for automating iOS Simulators"
  homepage "https://fbidb.io"
  url "https://github.com/facebook/idb/releases/download/v1.5.0.b1/idb-companion.universal.tar.gz"
  # Set explicitly: Homebrew infers "1.5.0" from the URL and silently drops the
  # ".b1" prerelease suffix, which would make a beta look like a final release.
  version "1.5.0.b1"
  sha256 "845ebb1aed9c18d10abc54053517b89355d0f06d511afe549cdeaab8fdfdc106"
  license "MIT"
  head "https://github.com/facebook/idb.git", branch: "main"

  # Xcode is a runtime requirement, not just a build one: the companion loads
  # CoreSimulator and MobileDevice from the selected developer directory.
  depends_on xcode: "13.0"

  def install
    # v1.5.0 ships a flat tree: idb_companion, idb-repl, Resources/ and the
    # SwiftPM resource bundles all sit at the archive root. v1.1.8 nested
    # everything under a wrapper directory holding bin/ and Frameworks/.
    #
    # idb_companion resolves Resources/ as a sibling of its own binary and
    # crashes outright when the shims are absent, so keep the tree intact in
    # libexec and symlink the executables rather than cherry-picking them.
    libexec.install Dir["*"]

    # `brew install` emits "Failed to fix install linkage" for
    # Resources/libShimulator-iOS.dylib. This is benign, and there is no way to
    # silence it from here. Homebrew rewrites the install ID of every dylib in
    # the keg to the keg path, and these prebuilt shims were not linked with
    # -headerpad_max_install_names, so the longer path will not fit in the
    # header. The IDs are never resolved -- the shims are injected by absolute
    # path via DYLD_INSERT_LIBRARIES -- so nothing downstream cares.
    #
    # Don't try to dodge it by rewriting the IDs here first: Keg#fix_dynamic_linkage
    # walks the whole keg and rewrites every dylib unconditionally, whatever the
    # existing ID is, and offers no formula-level opt-out. The real fix is
    # upstream, in how the shims are linked.
    bin.install_symlink libexec/"idb_companion"
    bin.install_symlink libexec/"idb-repl"
  end

  test do
    # Both bin entries must resolve back into libexec, alongside Resources/.
    # Assert the layout directly: --help and --list still succeed on a tree
    # with Resources/ deleted, so neither proves the install block is right.
    assert_equal (libexec/"idb_companion").realpath, (bin/"idb_companion").realpath
    assert_equal (libexec/"idb-repl").realpath, (bin/"idb-repl").realpath

    assert_predicate libexec/"Resources/libShimulator-iOS.dylib", :exist?
    assert_predicate libexec/"Resources/libRepl-iOS.dylib", :exist?
    assert_predicate libexec/"Resources/SimulatorFrameworkBridge", :exist?

    assert_match "build_date", shell_output("#{bin}/idb_companion --version")
    assert_match "idb-repl built at", shell_output("#{bin}/idb-repl --version")
  end
end
