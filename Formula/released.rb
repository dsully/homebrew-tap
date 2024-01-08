class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.1"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-aarch64-apple-darwin.tar.xz"
      sha256 "5967237d13ce160fd55f68e2a658b282bfb746b796cced2da1e18f37ffc35e47"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "559a1803d9bf6e25686dc47a19f37d4d3d1621da6fceef948f19cdc776963d90"
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
