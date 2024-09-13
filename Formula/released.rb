class Released < Formula
  desc "Install and manage dev tools."
  homepage "https://github.com/dsully/released"
  version "0.0.10"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dsully/released/releases/download/0.0.10/released-aarch64-apple-darwin.tar.xz"
    sha256 "e86fe20f2937636e6b96463c6b00f45b85ad5f53bb3fa4093b05fade37138931"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dsully/released/releases/download/0.0.10/released-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "b1a2abcc7f4fa2ed5ae58c5cc7f898eb6b5f812928c8f3ab8e9cc1370ee6a716"
  end
  license "MIT"

  depends_on "xz"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "released" if OS.mac? && Hardware::CPU.arm?
    bin.install "released" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
