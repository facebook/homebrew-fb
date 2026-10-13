Facebook Homebrew Tap
=====================

This is a [Homebrew][brew] tap for formulae for software developed by Facebook.


Setup
-----

Using these formulae requires Homebrew, which in turn requires Xcode. If you
have not yet installed Homebrew, a quick summary is at the end of this
document.

Once homebrew is installed, simply run:

    brew tap facebook/fb

Some of these formulae may require OS X 10.10 (Yosemite) or higher.


Use
---

To install software, just use `brew install` with the name of the formula. You
may wish to run `brew update` before hand to get the latest version of the
formulae. For example, to install the latest version of the thrift compiler:

    brew update
    brew install fbthrift-compiler

or to install the Buck build system from the latest HEAD commit:

    brew install --HEAD buck

To upgrade software:

    brew update
    brew upgrade    # upgrade all software installed with Homebrew
    brew upgrade fbthrift-compiler   # update just the thrift compiler


Swift packages
--------------

This repository is also a Swift package offering [idb][idb]'s libraries
(`FBSimulatorControl`, `FBDeviceControl`, and the rest), each a product made
of the prebuilt XCFrameworks attached to an idb release. Its `Package.swift`
is rendered for each release, like the idb formulae, and each idb release is
tagged here (a prerelease such as `v1.5.0.b5` as `v1.5.0-b5`):

    .package(url: "https://github.com/facebook/homebrew-fb", from: "1.7.0")

and in a target's dependencies:

    .product(name: "FBSimulatorControl", package: "homebrew-fb")

The libraries need macOS 15. Their runtime resources (the simulator guests and
shims) ship separately, in the release's `idb-libraries.macos-arm64.tar.gz`;
idb's documentation covers where they go.


Contributing
------------

Please file bug reports and feature requests as GitHub issues against the individual project, not this repository - however, we do accept pull requests here.

To do development on these formulae, first fork the repository on GitHub. Add
your fork as a remote to your local clone:

    cd $(brew --prefix)/Library/Taps/facebook/homebrew-fb
    git remote add me git@github.com:YOUR_GITHUB_USERNAME/homebrew-fb.git
    git fetch me

To propose changes, push to your fork (e.g. with `git push me +main`) and
submit pull request on GitHub.

If you do not work for Facebook, you will need to [submit a Contributor License
Agreement ("CLA")][cla]. You only need to do this once to work on any of
Facebook's open source projects.

We follow Homebrew's [standard coding style][style].


Appendix: overview of installing Homebrew
-----------------------------------------

The Homebrew developers suggest installing Homebrew at `/usr/local` to maximize
compatibility with existing software. To do so, follow the instructions on
[their website][brew].

This author prefers `/opt/homebrew`, finding that it works well enough in
practice and keeps a cleaner separation between other software which might use
`/usr/local`. To install at `/opt/homebrew`, you can use:

    sudo mkdir /opt/homebrew
    sudo chown `whoami` /opt/homebrew
    curl -sSLf -o homebrew-installer https://raw.githubusercontent.com/Homebrew/install/master/install
    perl -pi -e s,/usr/local,/opt/homebrew, homebrew-installer
    ruby homebrew-installer
    rm homebrew-installer
    echo '$PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"' >> ~/.bashrc


References
----------
`brew help`, `man brew`, or the Homebrew [documentation][].

[brew]: http://brew.sh/
[idb]: https://github.com/facebook/idb
[cla]: https://code.facebook.com/cla
[style]: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
[documentation]: https://github.com/Homebrew/homebrew/tree/master/share/doc/homebrew#readme

License
-------
This project uses BSD 3-Clause License, as found in the [LICENSE](https://github.com/facebook/homebrew-fb/blob/main/LICENSE) file.
