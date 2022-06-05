# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

# frozen_string_literal: true

class Buck < Formula
  BUCK_VERSION = "2021.05.05.01"
  BUCK_RELEASE_TIMESTAMP = "1651743283"
  desc "Facebook's Buck build system"
  homepage "https://buckbuild.com/"
  url "https://github.com/facebook/buck/archive/v#{BUCK_VERSION}.tar.gz"
  sha256 "d044df68cf278bee78ad3ee6eedc89b2f0ca23f3e5c8e8250a6819a9546944cc"
  license "Apache-2.0"
  revision 0
  head "https://github.com/facebook/buck.git", branch: "main"

  bottle do
    root_url "https://github.com/facebook/buck/releases/download/v#{BUCK_VERSION}"
    sha256 cellar: :any_skip_relocation, yosemite: "9415d00cfc18c5b4e2088de10a938155a5597b2e468a372296907ea2f12610b7"
  end

  depends_on "ant@1.9"
  depends_on "openjdk@8"

  def install
    # First, bootstrap the build by building Buck with Apache Ant.
    ENV["JAVA_HOME"] = Formula["openjdk@8"].opt_libexec/"openjdk.jdk/Contents/Home"
    ant_path = `"#{HOMEBREW_PREFIX}"/bin/brew --prefix ant@1.9`
    ant_1_9 = ant_path.strip + "/bin/ant"
    ohai "Bootstrapping buck with ant using " + ant_1_9
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
