# typed: true
# frozen_string_literal: true

# This file was generated by Homebrew Releaser. DO NOT EDIT.
class MacosDefaults < Formula
  desc "Tool for managing macos defaults declaratively via yaml files"
  homepage "https://github.com/dsully/macos-defaults"
  url "https://github.com/dsully/macos-defaults/archive/v0.0.1.tar.gz"
  sha256 "568008248f5f1c51f6dc532c6e84d1168c5c71b3993f0f233bfec3877e2fa05a"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/dsully/macos-defaults/releases/download/v0.0.1/macos-defaults-0.0.1-darwin-amd64.tar.gz"
      sha256 "a5d38f8e64fee9183cb9f56ed0d729b2d5a46e93986bdb2e7f29edbf4d168bd1"
    end

    on_arm do
      url "https://github.com/dsully/macos-defaults/releases/download/v0.0.1/macos-defaults-0.0.1-darwin-arm64.tar.gz"
      sha256 "cc3dec06da3b8574661f57df5abfd99e400769291cf35e82ef73779e5a80838e"
    end
  end

  def install
    bin.install "macos-defaults"

output = Utils.popen_read("#{bin}/macos-defaults completions bash")
(bash_completion/"macos-defaults.bash").write output

output = Utils.popen_read("#{bin}/macos-defaults completions fish")
(fish_completion/"macos-defaults.fish").write output

output = Utils.popen_read("#{bin}/macos-defaults completions zsh")
(zsh_completion/"macos-defaults.zsh").write output

prefix.install_metafiles
  end

  test do
    system "macos-defaults -h"
  end
end