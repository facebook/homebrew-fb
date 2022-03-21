# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class Watchman < Formula
  desc "Watch files and take action when they change"
  homepage "https://github.com/facebook/watchman"
  url "https://github.com/facebook/watchman/releases/download/v2022.03.21.00/watchman-v2022.03.21.00-macos.zip"
  sha256 "6c3b47e86a15de55093a6cd1c13243fe7e2066e63c475d82c475382aba9c7e44"
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
