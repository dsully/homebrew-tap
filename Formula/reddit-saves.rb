# typed: true
# frozen_string_literal: true

# This file was generated by Homebrew Releaser. DO NOT EDIT.
class RedditSaves < Formula
  desc "Tool to export reddit saved posts"
  homepage "https://github.com/dsully/reddit-saves"
  url "https://github.com/dsully/reddit-saves/archive/v0.0.1.tar.gz"
  sha256 "ae8d7292f51871dfaba1e78e7102232b2433c0d1f59c3b2fa1f9d64157036f25"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dsully/reddit-saves/releases/download/v0.0.1/reddit-saves-0.0.1-darwin-amd64.tar.gz"
      sha256 "9460babfe21e8a04550ac85e9a90dd1215e41286d5ee880079600979191a632f"
    end

    on_arm do
      url "https://github.com/dsully/reddit-saves/releases/download/v0.0.1/reddit-saves-0.0.1-darwin-arm64.tar.gz"
      sha256 "30176a03d5af868eb8b31e390adcba89f5a5c7085512b1042d4764b58b1580e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dsully/reddit-saves/releases/download/v0.0.1/reddit-saves-0.0.1-linux-amd64.tar.gz"
      sha256 "f6467c104e47051044f0d20e40c9d33c1a89df5bff1e6d7d01da7c44c34cc66d"
    end
  end

  def install
    bin.install "reddit-saves"
  end

  test do
    system "reddit-saves -h"
  end
end
