class Buck < Formula
  BUCK_VERSION = "2020.06.29.01".freeze
  BUCK_RELEASE_TIMESTAMP = "1593441972".freeze
  desc "The Buck build system"
  homepage "https://buckbuild.com/"
  url "https://github.com/facebook/buck/archive/v#{BUCK_VERSION}.tar.gz"
  sha256 "d76964cd50029ac06d52dc31321e8477c47cb19b90a8b432bb3efdbb66fbcd88"
  head "https://github.com/facebook/buck.git"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{BUCK_VERSION}"
    cellar :any_skip_relocation
    sha256 "c8d295aa5e603d4bd9e4c4fcc99be002b33f6dc9df4169c342f4cd87ffb41fc2" => :yosemite
  end

  depends_on "ant@1.9"
  depends_on :java => "1.8"

  def install
    # First, bootstrap the build by building Buck with Apache Ant.
    ant_path = `"#{HOMEBREW_PREFIX}"/bin/brew --prefix ant@1.9`
    ant_1_9 = ant_path.strip + "/bin/ant"
    ohai "Bootstrapping buck with anti using " + ant_1_9
    system(
      ant_1_9,
      "-Drelease.version=#{BUCK_VERSION}",
      "-Drelease.timestamp=#{BUCK_RELEASE_TIMESTAMP}",
    )
    # Mark the build as successful.
    touch "ant-out/successful-build"
    # Now, build the Buck PEX archive with the Buck bootstrap.
    ohai "Building buck with buck"
    mkdir_p bin
    system(
      "./bin/buck",
      "build",
      "-c",
      "buck.release_version=#{BUCK_VERSION}",
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
