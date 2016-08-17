class Fbsimctl < Formula
  desc "A Powerful Command Line for Managing iOS Simulators"
  homepage "https://github.com/facebook/FBSimulatorControl/fbsimctl/README.md"
  url "https://github.com/facebook/FBSimulatorControl/tarball/v0.1.2"
  sha256 "fa14cdb4856b5fc10d7dc4416d2532142fbd7833c7ae48e2c4caf2def659376d"
  head "https://github.com/facebook/FBSimulatorControl.git"

  depends_on "carthage"
  depends_on :xcode => ["7", :build]

  def install
    system "./build.sh", "fbsimctl", "build", prefix
  end

  test do
    system "fbsimctl", "list"
  end
end
