class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/1.0.3.tar.gz"
  sha256 "80ff7e8ebe093e85005d4de0978fc5f5c037a7556951b0702eb7b8b14739b19a"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/1.0.3"
    cellar :any
    sha256 "0bf22cd7d1512533a53a69380653825f3f5c0af3215a62e8249e2872d81eb05d" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.20.0"

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

end

