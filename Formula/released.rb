class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.5"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.5/released-aarch64-apple-darwin.tar.xz"
      sha256 "2fe5fc0b9026cff60434d0d9c7ecf75ce3b97f5120c348d9d2ad694f127cf93f"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.5/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4c61d39a610622227c39614e366d95b683d6c293ec0788f9a4f38b47d609a0eb"
    end
  end
  license "MIT"

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
