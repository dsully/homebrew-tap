class MacosDefaults < Formula
  desc "Defaults setting for macOS"
  version "0.1.0"
  on_macos do
    on_arm do
      url "https://github.com/dsully/macos-defaults/releases/download/0.1.0/macos-defaults-aarch64-apple-darwin.tar.xz"
      sha256 "d7f140bb038ff94759ba1e2d4af29a1eecbf5630854ead83d2273c13d9078691"
    end
  end
  license "MIT"

  def install
    on_macos do
      on_arm do
        bin.install "macos-defaults"
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
