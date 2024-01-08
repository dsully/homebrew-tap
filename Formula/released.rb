class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.1"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-aarch64-apple-darwin.tar.xz"
      sha256 "25cb3f3bbd3e5e390c3b4a31aa0f17e414191ada2327341e5da9252734624981"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6da0683befd19b6ae2842af97f01db70cf05466e853ff7160aefd07a7c6eae68"
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
