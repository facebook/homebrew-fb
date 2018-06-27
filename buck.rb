require "open3"

class Buck < Formula
  @@buck_version = "2018.03.26.01"
  @@buck_release_time = "1522099141"
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  head "https://github.com/facebook/buck.git"
  version @@buck_version
  url "https://api.github.com/repos/facebook/buck/tarball/v2018.03.26.01"
  sha256 "7c392ae9450e093310c3d65c57fab42c04662e26d9b61b70e58a7d515ee6334c"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{@@buck_version}"
    cellar :any_skip_relocation
    sha256 "fddd76cd15c04bad30c297ff2454932c9ce7cc1a183e9963ddd117cfe42f907d" => :yosemite_or_later
  end

  depends_on :java => "1.8+"
  depends_on "ant"

  def install
    ENV["BUCK_RELEASE"] = @@buck_version
    ENV["BUCK_RELEASE_TIMESTAMP"] = @@buck_release_time
    # First, bootstrap the build by building Buck with Apache Ant.
    ohai "Bootstrapping buck with ant"
    system "ant"
    # Mark the build as successful.
    File.open("build/successful-build", "w") {}
    # Now, build the Buck PEX archive with the Buck bootstrap.
    ohai "Building buck with buck"
    mkdir_p "#{bin}"
    system "./bin/buck", "build", "buck", "--out", "#{bin}/buck"
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
