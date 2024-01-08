class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.2"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.2/released-aarch64-apple-darwin.tar.xz"
      sha256 "038f31a96750833049b5aabfa05416fcd5c41c0ac0c0e410f01bc5d43ae473a7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.2/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9fa9449ee4361f57b747655b4098b018aee56e062a1336b593d294f22e417828"
    end
  end
  license "MIT"

  def install
    on_macos do
      if Hardware::CPU.type == :arm
        bin.install "released"
      else
        bin.install
      end
    end

    on_linux do
      if Hardware::CPU.type == :arm
        bin.install
      else
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
