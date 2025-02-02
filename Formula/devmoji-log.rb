class DevmojiLog < Formula
  desc "Devmoji git log"
  homepage "https://github.com/dsully/devmoji-log"
  version "0.0.1"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dsully/devmoji-log/releases/download/v0.0.1/devmoji-log-aarch64-apple-darwin.tar.xz"
    sha256 "470446abca1525dc14530aa98fd34fd665583514363aff10eac48d866b92b3f8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dsully/devmoji-log/releases/download/v0.0.1/devmoji-log-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "b68391c4f39cf0ad0f0c7aaee46a1ead49ca94cbe30d8e6c0116a27ce1860394"
  end
  license "MIT"

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
    bin.install "devmoji-log" if OS.mac? && Hardware::CPU.arm?
    bin.install "devmoji-log" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
