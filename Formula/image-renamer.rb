class ImageRenamer < Formula
  desc "Rename screen shots & images using OpenAI Vision"
  version "0.1.0"
  on_macos do
    on_arm do
      url "https://github.com/dsully/image-renamer/releases/download/0.1.0/image-renamer-aarch64-apple-darwin.tar.xz"
      sha256 "f41afea75e38879c41a006d8701b4cf632ecebb96776288985bd58565a3b081d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/dsully/image-renamer/releases/download/0.1.0/image-renamer-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "17ef9bed6b8626e554cd1dd9753039568d634b7f1e92d4c54360cdc02ede7f7f"
    end
  end
  license "MIT"

  def install
    on_macos do
      on_arm do
        bin.install "image-renamer"
      end
    end
    on_linux do
      on_intel do
        bin.install "image-renamer"
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
