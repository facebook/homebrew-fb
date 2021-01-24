# frozen_string_literal: true

class Buck < Formula
  BUCK_VERSION = "2021.01.12.01"
  BUCK_RELEASE_TIMESTAMP = "1610431978"
  desc "Facebook's Buck build system"
  homepage "https://buckbuild.com/"
  url "https://github.com/facebook/buck/archive/v#{BUCK_VERSION}.tar.gz"
  sha256 "c89e86e8a8355f6bc921afe8218a3cb1138c896a97e3168cf5dd220b07d8d1b5"
  revision 1
  head "https://github.com/facebook/buck.git"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{BUCK_VERSION}"
    cellar :any_skip_relocation
    sha256 "84ed6c26e1796170bb1733c6ef8638099405a5007fc832d937a7c1e03ee337e2" => :yosemite
  end

  depends_on "ant@1.9"
  depends_on "openjdk@8"

  def install
    # First, bootstrap the build by building Buck with Apache Ant.
    ENV["JAVA_HOME"] = Formula["openjdk@8"].opt_libexec/"openjdk.jdk/Contents/Home"
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
    bin.env_script_all_files(libexec/"bin",
      JAVA_HOME: Formula["openjdk@8"].opt_libexec/"openjdk.jdk/Contents/Home")
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
