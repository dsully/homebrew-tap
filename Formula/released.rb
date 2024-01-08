class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.1"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-aarch64-apple-darwin.tar.xz"
      sha256 "114fed7381f5cff46f9d464c8d6c5950f9f77050abaa0c5cdb3dd217d62b175c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "263df23eb6c22297d772ce1ab72d191e9122a371a6d2e29edb13e1f47ba31a32"
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
