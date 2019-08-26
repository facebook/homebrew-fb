class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.9.tar.gz"
  sha256 "dc2ad4f9f5365c35de1a1529179830aea218e9bd4c59d0deff7d32b838ba9d76"
  head "https://github.com/facebook/idb.git"

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.23.0_1"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.9"
    cellar :any
    sha256 "cd6527b086bd6033a5dda5e5a0edc90dd8eaf92eb71ececf0de7d1591e940ca6" => :mojave
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

