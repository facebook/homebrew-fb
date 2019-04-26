class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.1.tar.gz"
  sha256 "8438e0d15cbef03879ec639c969297df8badb8b87d153b95e5487f22e221c637"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.1"
    cellar :any
    sha256 "deb77811cab4f99f6a9990770308c315b075798ac131282ed244557bf2667dc8" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.20.0"

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

end

