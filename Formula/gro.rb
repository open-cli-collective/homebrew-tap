class Gro < Formula
  desc "Read-only command-line interface for Google services"
  homepage "https://github.com/open-cli-collective/google-readonly"
  license "MIT"
  version "1.0.32"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_arm64.tar.gz"
      sha256 "a5cc1992c477b60347bbaf4661c8acde9315b51c42858d00067d8ed700341b6f"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_amd64.tar.gz"
      sha256 "58e818028dcd892ae6f257314048ff1573ad0fd9c0be2cb0828cc368adfbd475"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_arm64.tar.gz"
      sha256 "7e1e8ace606a8acb72ec59e68489ba5926ef67a1f8fc36a276f7935fa230d3af"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_amd64.tar.gz"
      sha256 "8fb5f42258714e420149bfb89f95927b635431383b0001d3f4edb21e2f5232ea"
    end
  end

  def install
    bin.install "gro"
  end

  def caveats
    <<~EOS
      To set up gro:
      1. Create OAuth credentials at https://console.cloud.google.com/
      2. Save credentials to ~/.config/gro/credentials.json
      3. Run: gro gmail search "test" to authenticate

      See https://github.com/open-cli-collective/google-readonly#setup for detailed instructions.
    EOS
  end

  test do
    assert_match "gro", shell_output("#{bin}/gro --help")
  end
end
