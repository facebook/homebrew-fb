# frozen_string_literal: true

class Buck < Formula
  BUCK_VERSION = "2020.10.21.01"
  BUCK_RELEASE_TIMESTAMP = "1603230110"
  desc "Facebook's Buck build system"
  homepage "https://buckbuild.com/"
  url "https://github.com/facebook/buck/archive/v#{BUCK_VERSION}.tar.gz"
  sha256 "b0db2a134c8e11937de9610ed61d80adfde4e68f7661f54749d6340336f04f78"
  head "https://github.com/facebook/buck.git"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{BUCK_VERSION}"
    cellar :any_skip_relocation
    sha256 "bd74aa9f95fd5a8929c7e120ad68c375ec3db311eef462d4e8023c6eabbc5f24" => :yosemite
  end

  depends_on "ant@1.9"
  depends_on "openjdk@8"

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
