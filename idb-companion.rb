class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.5.tar.gz"
  sha256 "125cce6b420ad8cfa351024f0697c97b6c4ba427f4ee83999bf924ff1c82fd25"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.5"
    cellar :any
    sha256 "941ef3e83afe3a7840a8d8b59ee97532fbdd907d8c78089f7ccde07e763315db" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.20.0"

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

end

