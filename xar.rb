class Xar < Formula
  desc "The eXecutable Archive Format"
  homepage "https://github.com/facebookincubator/xar"
  url "https://github.com/facebookincubator/xar/archive/v18.07.12.tar.gz"
  sha256 "517414281f02af5c304cb87f08c855e3e5ca812580ff94ff48972d68ec75558d"

  depends_on "cmake" => :build
  depends_on "osxfuse"
  depends_on "squashfuse"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "xarexec_fuse", "--help"
  end
end
