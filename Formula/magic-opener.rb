class MagicOpener < Formula
  homepage "https://github.com/dsully/magic-opener"
  version "0.0.1"
  on_macos do
    on_arm do
      url "https://github.com/dsully/magic-opener/releases/download/0.0.1/magic-opener-aarch64-apple-darwin.tar.xz"
      sha256 "d4d0748ca8db7feeeb2a49accb1c7cee7af2e7e8d309455e36c02b5d9eda1e9b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/magic-opener/releases/download/0.0.1/magic-opener-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "93da04cb6de9189fdd0b24d5277b175f5aabbc66eb4acf072cc917a5d8fd46f9"
    end
  end
  license "MIT"

  def install
    on_macos do
      on_arm do
        bin.install "open"
      end
    end
    on_linux do
      on_intel do
        bin.install "open"
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
