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
  # companion provably come from one build. Since 1.5.0b3 the release workflow
  # also publishes to PyPI, and the artifacts are byte-identical -- the wheel
  # there carries the same sha256 pinned below -- so this is a choice of
  # provenance rather than availability, and either source would install the
  # same bytes.
  url "https://github.com/facebook/idb/releases/download/v1.5.1/fb_idb-1.5.1-py3-none-any.whl"
  # Kept in the release's own form so all three idb formulae carry one version.
  version "1.5.1"
  sha256 "66e8f79a78c60c58696c72ee32220491e5107f843d44660f5c7fa471431280b2"
  license "MIT"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9914fd64c23cfbeb2f54440ddcd3245b0b2946159950e06af624795371e2c0b5"
  end

  depends_on "python@3.14"

  # The wheel, not the sdist, and installed via a resource rather than from
  # buildpath. Both halves of that need explaining.
  #
  # The sdist ships no generated protobuf code: its build_py runs
  # grpc_tools.protoc over proto/idb.proto at install time. Installing it makes
  # pip resolve setup_requires in an isolated build environment, which pulls
  # grpcio-tools, grpcio, setuptools, typing-extensions and a second protobuf
  # from PyPI -- roughly ten packages this formula never declares, unpinned and
  # unchecksummed, fetched during `brew install`. The published wheel already
  # contains idb_pb2.py and idb_grpc.py, so installing it needs no build at all.
  #
  # It cannot simply be the main url, though: a wheel is a zip, UnpackStrategy
  # detects by magic number, and Homebrew would extract it into buildpath,
  # where pip cannot install it. Resources are the one path that keeps a
  # py3-none-any wheel as a file (Language::Python::Virtualenv#pip_install
  # re-appends the basename for exactly this case), so fb-idb is installed from
  # a resource. The url and sha256 match the main url, so Homebrew downloads
  # the artifact once.
  resource "fb-idb" do
    url "https://github.com/facebook/idb/releases/download/v1.5.1/fb_idb-1.5.1-py3-none-any.whl"
    sha256 "66e8f79a78c60c58696c72ee32220491e5107f843d44660f5c7fa471431280b2"
  end

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

  # multidict and protobuf are the only two dependencies with C extensions, and
  # building them from the sdist is the whole of this formula's install cost --
  # a minute of clang on an otherwise instant install. Both publish a pure
  # Python py3-none-any wheel, which is the one wheel shape Homebrew's resource
  # handling supports (see Language::Python::Virtualenv), so take those instead
  # and compile nothing.
  #
  # The trade is that both lose their C acceleration, where a plain
  # `pip install fb-idb` would have picked the binary wheel. For a CLI issuing
  # gRPC control messages that is not measurable; if a bulk path such as
  # `idb video-stream` or a large `idb file push` ever shows it, the fix is to
  # bottle this formula rather than to go back to building on every install.
  resource "multidict" do
    url "https://files.pythonhosted.org/packages/81/08/7036c080d7117f28a4af526d794aab6a84463126db031b007717c1a6676e/multidict-6.7.1-py3-none-any.whl"
    sha256 "55d97cc6dae627efa6a6e548885712d4864b81110ac76fa4e534c03819fa4a56"
  end

  # Pinned deliberately: idb's generated *_pb2.py modules call
  # ValidateProtobufRuntimeVersion(PUBLIC, 7, 35, 1) and refuse to import
  # against an older runtime. Pure Python wheel, per the note above -- the
  # sdist builds the upb C++ backend, which is the expensive half of the
  # install.
  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/19/c7/5f7c636ec43e0c545e28d1f1db71990108306f7bdcb89f069ba97e428e7f/protobuf-7.35.1-py3-none-any.whl"
    sha256 "4bc97768d8fe4ad6743c8a19403e314511ed9f6d13205b687e52421c023ac1b9"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14")
    venv.pip_install resources.reject { |r| r.name == "fb-idb" }
    venv.pip_install_and_link resource("fb-idb")
  end

  test do
    assert_match "usage", shell_output("#{bin}/idb --help")

    # Nothing here should be compiled: fb-idb, multidict and protobuf are all
    # taken as pure Python wheels so that installing runs no compiler and no
    # protoc. Assert it, or a well-meaning resource refresh will swap them back
    # to sdists and quietly restore both the clang step and the unpinned
    # build-time downloads described above.
    assert_empty Dir.glob(libexec/"lib/python*/site-packages/**/*.so"),
                 "expected no compiled extensions in the virtualenv"
  end
end
