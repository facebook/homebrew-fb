class Fbsimctl < Formula
  desc "A Powerful Command Line for Managing iOS Simulators"
  homepage "https://github.com/facebook/FBSimulatorControl/fbsimctl/README.md"
  url "https://github.com/facebook/FBSimulatorControl/tarball/v0.4.0"
  sha256 "4a8bb8aed15f756aeb57e4a1f8724e40a3dfaa27740ae1644021386ab64bd9fb"
  head "https://github.com/facebook/FBSimulatorControl.git"

  depends_on "carthage"
  depends_on :xcode => ["8.2", :build]

  def install
    system "./build.sh", "fbsimctl", "build", prefix
  end

  test do
    system "fbsimctl", "list"
  end
end
