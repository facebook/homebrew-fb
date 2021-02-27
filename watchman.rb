# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class Watchman < Formula
  desc "Watch files and take action when they change"
  homepage "https://github.com/facebook/watchman"
  url "https://github.com/facebook/watchman/releases/download/v2021.02.22.00/watchman-v2021.02.22.00-macos.zip"
  sha256 "45fe17fc69acaaf209c12022191af4aa7f5b350ad9ba0f1ce51922aa6b4d7ec5"
  license "Apache-2.0"
  version_scheme 1

  def install
    bin.install "bin/watchman"
    lib.install Dir["lib/*"]
    mkdir_p "/usr/local/var/run/watchman"
    chmod 0o2777, "/usr/local/var/run/watchman"
  end

  def caveats
    <<~EOS
      If you plan to use watchman on more than one user, run `chmod g+s /usr/local/var/run/watchman`.
      We cannot do this for you.  See https://github.com/Homebrew/brew/issues/6019.
    EOS
  end

  test do
    system "watchman", "version"
  end
end
