class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.3"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.3/released-aarch64-apple-darwin.tar.xz"
      sha256 "7e6d89e911f3a9102587acbbe2eca0dadf9b6d8f63d1c848fc832db261c62a51"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.3/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f4d320da8fc55e8cee34d08cab553d24f0116712bdf97e2d8ed1f64506905d02"
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
