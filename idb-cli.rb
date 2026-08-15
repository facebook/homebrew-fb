# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCli < Formula
  include Language::Python::Virtualenv

  desc "Command-line client for automating iOS Simulators"
  homepage "https://fbidb.io"
  # Taken from the GitHub release rather than PyPI so the client and the
  # companion stay version-locked. PyPI is not an option regardless: the newest
  # published fb-idb is 1.1.7 and 1.5.0b1 was never uploaded, pending
  # trusted-publishing setup for the project.
  url "https://github.com/facebook/idb/releases/download/v1.5.0.b1/fb_idb-1.5.0b1.tar.gz"
  # Kept in the release's own form so all three idb formulae carry one version.
  version "1.5.0.b1"
  sha256 "d258d83c64261f94f9e72fcd20e0e8ff6b56091791e218e59364c3b5fe20c85f"
  license "MIT"

  depends_on "python@3.14"

  resource "aiofiles" do
    url "https://files.pythonhosted.org/packages/41/c3/534eac40372d8ee36ef40df62ec129bee4fdb5ad9706e58a29be53b2c970/aiofiles-25.1.0.tar.gz"
    sha256 "a8d728f0a29de45dc521f18f07297428d56992a742f0cd2701ba86e44d23d5b2"
  end

  resource "grpclib" do
    url "https://files.pythonhosted.org/packages/5b/28/5a2c299ec82a876a252c5919aa895a6f1d1d35c96417c5ce4a4660dc3a80/grpclib-0.4.9.tar.gz"
    sha256 "cc589c330fa81004c6400a52a566407574498cb5b055fa927013361e21466c46"
  end

  resource "h2" do
    url "https://files.pythonhosted.org/packages/e7/85/7c366e69d84c17bb778fe41419e1fbcce3033d5b7ce29bbffff0a98b859f/h2-4.4.1.tar.gz"
    sha256 "4e866ffb1a869ae14dd9b5e6beb5c24a13da0495ad72b65925ded182521c1516"
  end

  resource "hpack" do
    url "https://files.pythonhosted.org/packages/26/5b/fcabf6028144a8723726318b07a32c2f3314acdff6265743cf08a344b18e/hpack-4.2.0.tar.gz"
    sha256 "0895cfa3b5531fc65fe439c05eb65144f123bf7a394fcaa56aa423548d8e45c0"
  end

  resource "hyperframe" do
    url "https://files.pythonhosted.org/packages/02/e7/94f8232d4a74cc99514c13a9f995811485a6903d48e5d952771ef6322e30/hyperframe-6.1.0.tar.gz"
    sha256 "f630908a00854a7adeabd6382b43923a4c4cd4b821fcb527e6ab9e15382a3b08"
  end

  resource "multidict" do
    url "https://files.pythonhosted.org/packages/1a/c2/c2d94cbe6ac1753f3fc980da97b3d930efe1da3af3c9f5125354436c073d/multidict-6.7.1.tar.gz"
    sha256 "ec6652a1bee61c53a3e5776b6049172c53b6aaba34f18c9ad04f82712bac623d"
  end

  # Pinned deliberately: idb's generated *_pb2.py modules call
  # ValidateProtobufRuntimeVersion(PUBLIC, 7, 35, 1) and refuse to import
  # against an older runtime.
  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/da/01/9ef0afd7999eb9badb3a768b4aedd78c86d4c65cfaf1958ab276199e76b4/protobuf-7.35.1.tar.gz"
    sha256 "ce115a26fe0c39a2c29973d914d327e516a6455464489fe3cd1e51a1b354f81a"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "treelib" do
    url "https://files.pythonhosted.org/packages/7a/31/145bdbee73d7ee4ac4e879c37faa196a32208b288ca4f308c1ad8db3f010/treelib-1.8.0.tar.gz"
    sha256 "e1be2c6b66ffbfae85079fc4c76fb4909946d01d915ee29ff6795de53aed5d55"
  end

  def install
    # setup.py takes the version from the environment and raises without it,
    # even though the sdist's own PKG-INFO already records it. The release
    # workflow exports FB_IDB_VERSION the same way before `python -m build`.
    ENV["FB_IDB_VERSION"] = version.to_s
    virtualenv_install_with_resources
  end

  test do
    assert_match "usage", shell_output("#{bin}/idb --help")
  end
end
