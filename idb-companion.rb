class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.2.tar.gz"
  sha256 "0c509365ba7d5ff49ccc5492d36018afb5ddf9fb5a71411174c455d447e37bee"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.2"
    cellar :any
    sha256 "e4141795dc0b030c23cf03990f387e28633f4e8abd0e82e861ceca54b5597198" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.20.0"

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

end

