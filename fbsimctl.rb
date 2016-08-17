class Fbsimctl < Formula
  desc "A Powerful Command Line for Managing iOS Simulators"
  homepage "https://github.com/facebook/FBSimulatorControl/fbsimctl/README.md"
  url "https://github.com/facebook/FBSimulatorControl/tarball/v0.1.1"
  sha256 "f971c28898457cc21d48542ddf6d269ee931190d702fe07083f4d2cddcb11fc4"
  head "https://github.com/facebook/FBSimulatorControl.git"

  depends_on "carthage"
  depends_on :xcode => ["7", :build]

  def install
    system "./build.sh", "fbsimctl", "build", "#{libexec}"
    bin.install_symlink "#{libexec}/fbsimctl"
  end

  test do
    system "fbsimctl", "list"
  end
end
