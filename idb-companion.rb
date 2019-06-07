class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.7.tar.gz"
  sha256 "b833524a6ba07140fe5333b5fb6b73a880aaa01c34fd504a23d6e29817280a0f"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.7"
    cellar :any
    sha256 "863a9b302f6cc1e0bd11ec8eda8ba9ce7d22b2bf06281a4fa57a3ba4340233b6" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.21.3"

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

