require "open3"

class Buck < Formula
  @@buck_version = "2018.07.23.01"
  @@buck_release_timestamp = "1532404151"
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  head "https://github.com/facebook/buck.git"
  version @@buck_version
  url "https://api.github.com/repos/facebook/buck/tarball/v2018.07.23.01"
  sha256 "6c77af8d3c8d9875370f69f286b5e64327c1bf8d4ad8aea0da4b20bd5f1b2e5a"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{@@buck_version}"
    cellar :any_skip_relocation
    sha256 "5dff9b8f92510fda45d4e66aeabf1588f8b09e2676182f6cd1f9651b11362109" => :yosemite_or_later
  end

  depends_on :java => "1.8+"
  depends_on "ant"

  def install
    # First, bootstrap the build by building Buck with Apache Ant.
    ohai "Bootstrapping buck with ant"
    system "ant"
    # Mark the build as successful.
    File.open("build/successful-build", "w") {}
    # Now, build the Buck PEX archive with the Buck bootstrap.
    ohai "Building buck with buck"
    mkdir_p "#{bin}"
    system(
      "./bin/buck",
      "build",
      "-c",
      "buck.release_version=#{@@buck_version}",
      "-c",
      "buck.release_timestamp=#{@@buck_release_timestamp}",
      "--out",
      "#{bin}/buck",
      "buck")
  end

  test do
    ohai "Setting up Buck repository in " + testpath
    (testpath/".buckconfig").write("")
    (testpath/"BUCK").write("cxx_binary(name = 'foo', srcs = ['foo.c'])")
    (testpath/"foo.c").write("#include <stdio.h>\nint main(int argc, char **argv) { printf(\"Hello world!\\n\"); }\n")
    ohai "Building and running C binary..."
    stdout, stderr, status = Open3.capture3("#{bin}/buck", "run", ":foo")
    stdout.chomp!
    ohai "Got output from binary: " + stdout
    assert_equal 0, status
    assert_equal "Hello world!", stdout
    ohai "Test complete."
  end
end
