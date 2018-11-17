require "open3"

class Buck < Formula
  @@buck_version = "2018.10.29.01"
  @@buck_release_timestamp = "1540624817"
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  head "https://github.com/facebook/buck.git"
  version @@buck_version
  url "https://api.github.com/repos/facebook/buck/tarball/v2018.10.29.01"
  sha256 "9d113ebb5d5402b214cef9e67cd4e95bbd709a31e6b0d221895bec9760d8d833"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{@@buck_version}"
    cellar :any_skip_relocation
    sha256 "2b777c70022440424d82f2fa6c893ba8fb4173971a1efcc40ab14e68558121b0" => :yosemite
  end

  depends_on :java => "1.8+"
  depends_on "ant"

  def install
    # https://github.com/Homebrew/brew/pull/4552 stopped extracting stuff for us
    if File.exists?("v#{@@buck_version}") then
      ohai "Homebrew didn't extract the source tarball. Extracting..."
      system("tar", "--strip-components", "1", "-xf", "v#{@@buck_version}")
    end
    ohai "Bootstrapping buck with ant"
    system "ant"
    # Mark the build as successful.
    File.open("ant-out/successful-build", "w") {}
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
