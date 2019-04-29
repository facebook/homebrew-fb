class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.4.tar.gz"
  sha256 "a05440e07b42c57f525c971cba569a294d640010d3cc8f7934375600d444175e"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.4"
    cellar :any
    sha256 "941ef3e83afe3a7840a8d8b59ee97532fbdd907d8c78089f7ccde07e763315db" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.20.0"

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

end

