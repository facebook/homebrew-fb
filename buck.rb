class Buck < Formula
  BUCK_VERSION = "2018.10.29.01".freeze
  BUCK_RELEASE_TIMESTAMP = "1540624817".freeze
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  url "https://github.com/facebook/buck/archive/v#{BUCK_VERSION}.tar.gz"
  sha256 "1e4222463031d9b20e313698022846e980113e4c87334e722691c2a7b19d16e9"
  head "https://github.com/facebook/buck.git"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{BUCK_VERSION}"
    cellar :any_skip_relocation
    sha256 "2b777c70022440424d82f2fa6c893ba8fb4173971a1efcc40ab14e68558121b0" => :yosemite_or_later
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
