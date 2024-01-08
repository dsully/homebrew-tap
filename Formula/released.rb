class Released < Formula
  desc "Install and manage dev tools."
  version "0.0.1"
  on_macos do
    on_arm do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-aarch64-apple-darwin.tar.xz"
      sha256 "ead7f5354bb9cce3833cef472f0452deaab138600d80f4995420044e33231a54"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/released/releases/download/0.0.1/released-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7517642d695c6da638db625a570965352dd61f297f53640495bc11efa777ec37"
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
