# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class Idb < Formula
  desc "iOS Development Bridge: command-line client and simulator companion"
  homepage "https://fbidb.io"
  # Metapackage: nothing is built from this, but Homebrew wants a url. Point it
  # at the same CLI wheel idb-cli installs, rather than the 28MB source
  # tarball, so Homebrew dedupes the download and this formula costs nothing of
  # its own beyond a 25KB README. Keep the url and sha256 in step with
  # idb-cli.rb or that dedup is silently lost.
  url "https://github.com/facebook/idb/releases/download/v1.5.0.b4/fb_idb-1.5.0b4-py3-none-any.whl"
  version "1.5.0.b4"
  sha256 "c5d39349c5b55bf81289c4250ac93dee263afe7b9a95d5b0da92063f51258507"
  license "MIT"

  # idb is normally used as a pair: the CLI talks to a companion, and the
  # companion is what actually drives the simulator. Installing this formula
  # gets both at a matching version. Either half can still be installed on its
  # own -- a CI host that only runs the companion does not need the client,
  # and a machine driving a remote companion does not need the native half.
  depends_on "idb-cli"
  depends_on "idb-companion"

  def install
    (pkgshare/"README.md").write <<~MARKDOWN
      idb #{version}

      This formula is a metapackage. The executables come from its dependencies:

        idb            -> idb-cli
        idb_companion  -> idb-companion
        idb-repl       -> idb-companion

      Install either half on its own with `brew install idb-cli` or
      `brew install idb-companion`.
    MARKDOWN
  end

  test do
    # Exercise both halves through the dependencies' own prefixes, since this
    # formula installs no executables of its own.
    cli = formula_opt_bin("idb-cli")
    companion = formula_opt_bin("idb-companion")

    assert_match "usage", shell_output("#{cli}/idb --help")
    assert_match "build_date", shell_output("#{companion}/idb_companion --version")
  end
end
