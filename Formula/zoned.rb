class Zoned < Formula
  version "0.1.2"
  on_macos do
    on_arm do
      url "https://github.com/dsully/zoned/releases/download/0.1.2/zoned-aarch64-apple-darwin.tar.xz"
      sha256 "1b41c75375578ddc652c605f5b39accd7f5f8e05e31a4e3b6437455083318704"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/zoned/releases/download/0.1.2/zoned-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6f93f215735e14b9a46a07d2541f79b548dc194816cc6d63f21ac92694da8d08"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "zoned"
      end
    end
    on_linux do
      on_intel do
        bin.install "zoned"
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
