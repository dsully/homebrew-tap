class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.2"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.2/released-aarch64-apple-darwin.tar.xz"
      sha256 "159b9b35d54c02952e1c9d79e46bd52ddfa6bdc9ef9c7e444cd2ff9ce352bc86"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.2/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "01a24473ce7995bbcd3216e14f79f63b17b4b481b121da8825568a0c5b6711f7"
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
