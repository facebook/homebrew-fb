class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.6.tar.gz"
  sha256 "ba75405900b066e2bea3c40a966bf6458499d9bad7b4c73c9e35025716d8055a"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.6"
    cellar :any
    sha256 "bc8c2d0b3052f69fce26c6c4debeb459325a3a03a0b0b1ad49b4a90155823ca3" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.20.0"

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

