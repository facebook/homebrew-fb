require "open3"

class Buck < Formula
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  head "https://github.com/facebook/buck.git"
  version "2015.09.21.01"
  url "https://github.com/facebook/buck/archive/v2015.09.21.01.tar.gz"
  sha256 "4de57e92910078a669dd8d13e52aadf23042f2be8ae96d3a5268b5a201d7abdc"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v2015.09.21.01"
    cellar :any_skip_relocation
    sha256 "1444dbf520bd712104089737cf110046d743940a7c89ee68cfe97f99a264870f" => :yosemite_or_later
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
