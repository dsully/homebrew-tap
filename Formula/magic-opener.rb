class MagicOpener < Formula
  homepage "https://github.com/dsully/magic-opener"
  version "0.0.2"
  on_macos do
    on_arm do
      url "https://github.com/dsully/magic-opener/releases/download/0.0.2/magic-opener-aarch64-apple-darwin.tar.xz"
      sha256 "fcf0cf57ac6aa84fb91e31212b6e80167703f96f6e93599a58a2ecf982df6192"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/magic-opener/releases/download/0.0.2/magic-opener-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e6c894d5250e45d6d6eafe73110f8cc436755907b50e6eca7af30850511462dd"
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
