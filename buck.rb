require "open3"

class Buck < Formula
  @@buck_version = "2016.01.18.01"
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  head "https://github.com/facebook/buck.git"
  version @@buck_version
  url "https://api.github.com/repos/facebook/buck/tarball/v2016.01.18.01"
  sha256 "ee19a6c027ff3d532ad81c852f5eb5bf56b617098c750ea12137c35b4a7e0419"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{@@buck_version}"
    cellar :any_skip_relocation
    sha256 "bcce69e2e2dd0cb2ac8b92ac67ae6b3018a66fcc6a1118ea2a65a23fc7cb1c82" => :yosemite_or_later
  end

  depends_on :java => "1.7+"
  depends_on :ant

  def install
    # First, bootstrap the build by building Buck with Apache Ant.
    system "ant"
    # Mark the build as successful.
    File.open("build/successful-build", "w") {}
    # Now, build the Buck PEX archive with the Buck bootstrap.
    system "./bin/buck", "build", "buck"
    mkdir_p "#{bin}"
    ohai "Finding PEX archive..."
    stdout, stderr, status = Open3.capture3("./bin/buck", "targets", "--show_output", "buck")
    if status == 0
      stdout.chomp!
      _, path = stdout.split(" ", 2)
      ohai "Installing buck in #{bin}/buck..."
      cp(path, "#{bin}/buck", :preserve => true)
      ohai "Done."
    else
      onoe "Could not find location of built buck: " + stderr
    end
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
