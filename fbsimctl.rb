class Fbsimctl < Formula
  desc "A Powerful Command Line for Managing iOS Simulators"
  homepage "https://github.com/facebook/FBSimulatorControl/fbsimctl/README.md"
  url "https://github.com/facebook/FBSimulatorControl/tarball/v0.1.0"
  sha256 "8e3e74cd816185ca4328618931aff879ae0050f1740393214dfef943fcda109e"
  head "https://github.com/facebook/FBSimulatorControl.git"
  
  depends_on "carthage"
  depends_on :xcode => ["7", :build]

  def install
    system "./build.sh", "cli", "build", "#{libexec}" 
    bin.install_symlink "#{libexec}/fbsimctl"
  end

  test do
    system "fbsimctl", "list"
  end
end
