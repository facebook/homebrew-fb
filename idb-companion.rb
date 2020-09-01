class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.14.tar.gz"
  sha256 "dc1bf88d2b6461b361f10ae152cd382a226549d21b5cde392a424914a5d428bd"
  head "https://github.com/facebook/idb.git"

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.29.1"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.14"
    cellar :any
    sha256 "b2ee634e7f04179c392217347c2f6cbd3542c2bdb1a113fefa803c3f01f80e53" => :mojave
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

