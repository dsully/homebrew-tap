class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.9"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.9/released-aarch64-apple-darwin.tar.xz"
      sha256 "e7c0823e5481350e48f0059d07f61e38bc253722c4e360eed0783bebf8286799"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.9/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "13ee67f38e7858bf6cdf782cc003fbeed4ba3ec6ba85a557c74f7358466ede04"
    end
  end
  license "MIT"
  
  depends_on "xz"

  def install
    on_macos do
      on_arm do
        bin.install "released"
      end
    end
    on_linux do
      on_intel do
        bin.install "released"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
