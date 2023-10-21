class Released < Formula
  desc "Install and manage dev tools."
  if Hardware::CPU.type == :arm
    url "https://github.com/dsully/released/releases/download/v0.0.1/released-aarch64-apple-darwin.tar.xz"
    sha256 "f2d85ddf58ed7f6b3a37e9ba367a6cd72664c86712d063b20f600f6cd0df176a"
  else
    url "https://github.com/dsully/released/releases/download/v0.0.1/"
  end
  version "0.0.1"
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
