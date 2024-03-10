class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.8"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.8/released-aarch64-apple-darwin.tar.xz"
      sha256 "f685d4d2e28f79e4bb53a2c05d0e29b6175c3f0173633c8274dc24d0dd2b33dc"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.8/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "581c57b180f3e7b6c44999069715bddebf7a5c0609151cfff21acfd6be085ed2"
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
