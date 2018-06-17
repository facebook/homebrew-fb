class Xar < Formula
  desc "The eXecutable Archive Format"
  homepage "https://github.com/facebook/xar"
  url "https://github.com/facebook/xar/archive/master.zip"
  version "0.0.1"
  sha256 "c94bb886ad9bd91ff3d1a65c58b7954b44b64d84ba2abc133426db93a112b9ef"

  depends_on "cmake" => :build
  depends_on :osxfuse
  depends_on "squashfs"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "xarexec_fuse --help"
  end
end
