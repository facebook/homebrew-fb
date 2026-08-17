# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class Idb < Formula
  desc "iOS Development Bridge: command-line client and simulator companion"
  homepage "https://fbidb.io"
  # Metapackage: nothing is built from this, but Homebrew wants a url. Reuse
  # the CLI sdist from the same release rather than the 28MB source tarball --
  # idb-cli already fetches it, so this adds no download of its own for a
  # formula whose own contents are a 25KB README.
  url "https://github.com/facebook/idb/releases/download/v1.5.0.b2/fb_idb-1.5.0b2.tar.gz"
  version "1.5.0.b2"
  sha256 "df818980d8c09f652e7aa781bdd093ab3a28b39da7645b020f64f3bcbc716604"
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
