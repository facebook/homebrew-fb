require "open3"

class Buck < Formula
  @@buck_version = "2018.07.09.01"
  @@buck_release_timestamp = "1531223387"
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  head "https://github.com/facebook/buck.git"
  version @@buck_version
  url "https://api.github.com/repos/facebook/buck/tarball/v2018.07.09.01"
  sha256 "3fc0b97ca6c79ef0f08c4bcbae256e482b494e0f5cb1b99256788ad97d170141"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{@@buck_version}"
    cellar :any_skip_relocation
    sha256 "e3676860ac0c10621730d0b3c270ecce3b47d9ed35b32365417088fa29c33bd7" => :yosemite_or_later
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
