class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.10.tar.gz"
  sha256 "0e09182a9b3cf8efc73a937edd2406ab13a86782741b0bb59ce330703462c20f"
  head "https://github.com/facebook/idb.git"

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.25.0_1"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.10"
    cellar :any
    sha256 "6e95179ca43e5cba3552e784b8f97e26cbe5d888b0ac56f6d0fb40d59c5e96b8" => :mojave
  end

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end
  
  def post_install
    [
      prefix/'Frameworks/FBDeviceControl.framework/Versions/A/Resources/libShimulator.dylib',
      prefix/'Frameworks/FBSimulatorControl.framework/Versions/A/Resources/libShimulator.dylib',
      prefix/'Frameworks/XCTestBootstrap.framework/Versions/A/Resources/libShimulator.dylib',
    ].each do |shim|
      system "codesign", "--force", "--sign", "-", "--timestamp=none", shim
    end
  end

end

