class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.1"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-aarch64-apple-darwin.tar.xz"
      sha256 "5de947647b88c6726f03db296ede0b03351000594af467fa3186d5737c763a82"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "761687be6f21079f1bd312ea0e6700cda7d21d291047c153c3bfec4481ae5e5a"
    end
  end
  license "MIT"

  def install
    if Hardware::CPU.type == :arm
      bin.install "released"
    else
      bin.install 
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
