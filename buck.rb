class Buck < Formula
  BUCK_VERSION = "2019.06.11.01".freeze
  BUCK_RELEASE_TIMESTAMP = "1560269334".freeze
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  url "https://github.com/facebook/buck/archive/v#{BUCK_VERSION}.tar.gz"
  sha256 "64a77ec56833d497238a4b7b37f1831f8059148aabd6311348c3ab6d6e72beea"
  head "https://github.com/facebook/buck.git"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{BUCK_VERSION}"
    cellar :any_skip_relocation
    sha256 "8fc4791c286a03427fdf9864ae5496a34121cbee75770fa866a270c4cbcc0c52" => :yosemite
  end

  depends_on "ant"
  depends_on :java => "1.8+"

  def install
    # First, bootstrap the build by building Buck with Apache Ant.
    ohai "Bootstrapping buck with ant"
    system "ant"
    # Mark the build as successful.
    touch "ant-out/successful-build"
    # Now, build the Buck PEX archive with the Buck bootstrap.
    ohai "Building buck with buck"
    mkdir_p bin
    system(
      "./bin/buck",
      "build",
      "-c",
      "buck.release_version=#{version}",
      "-c",
      "buck.release_timestamp=#{BUCK_RELEASE_TIMESTAMP}",
      "--out",
      "#{bin}/buck",
      "buck",
    )
  end

  test do
    ohai "Setting up Buck repository in " + testpath
    (testpath/".buckconfig").write("")
    (testpath/"BUCK").write("cxx_binary(name = 'foo', srcs = ['foo.c'])")
    (testpath/"foo.c").write("#include <stdio.h>\nint main(int argc, char **argv) { printf(\"Hello world!\\n\"); }\n")
    ohai "Building and running C binary..."
    stdout = shell_output("#{bin}/buck run :foo").chomp
    ohai "Got output from binary: " + stdout
    assert_equal "Hello world!", stdout
    ohai "Test complete."
  end
end
