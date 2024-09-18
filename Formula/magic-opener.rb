class MagicOpener < Formula
  desc "An 'open' replacement that tries to do the right thing."
  homepage "https://github.com/dsully/magic-opener"
  version "0.0.3"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/dsully/magic-opener/releases/download/0.0.3/magic-opener-aarch64-apple-darwin.tar.xz"
    sha256 "355b6efba74df0f1e1dfb578437c98b2b0badcc44a735fade0b358ae334a8890"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/dsully/magic-opener/releases/download/0.0.3/magic-opener-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "76ced22a3752fd0439f27d1bcbfe75f49057bd577c1287762fa7e52492fb234a"
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
    bin.install "open" if OS.mac? && Hardware::CPU.arm?
    bin.install "open" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
