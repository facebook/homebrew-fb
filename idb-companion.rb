class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.8.tar.gz"
  sha256 "695db5ff68e8589b2463284be32879d7b2d2f66b77cb9fde28f9ada8fcb709b4"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.8"
    cellar :any
    sha256 "2cbcd22db2350da460f6b91afa9c0567d26be88d3dffa4b0cec05caa2a405d36" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.22.0"

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

