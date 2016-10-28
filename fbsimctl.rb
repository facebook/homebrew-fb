class Fbsimctl < Formula
  desc "A Powerful Command Line for Managing iOS Simulators"
  homepage "https://github.com/facebook/FBSimulatorControl/fbsimctl/README.md"
  url "https://github.com/facebook/FBSimulatorControl/tarball/v0.2.2"
  sha256 "119718ee8a0611d087f46dda1603c6622b075270ef47889c2b16d781391e7c2b"
  head "https://github.com/facebook/FBSimulatorControl.git"

  depends_on "carthage"
  depends_on :xcode => ["8", :build]

  def install
    system "./build.sh", "fbsimctl", "build", prefix
  end

  test do
    system "fbsimctl", "list"
  end
end
