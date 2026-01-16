class GmailRo < Formula
  desc "Read-only command-line interface for Gmail"
  homepage "https://github.com/open-cli-collective/gmail-ro"
  license "MIT"
  version "1.0.7"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_arm64.tar.gz"
      sha256 "a82bd2a38dfde66237fe7961185b4939160cfda08afbcc11c98472d9ce411b36"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_amd64.tar.gz"
      sha256 "559cfd176e2f4b3d7a1cfe5d30688fda34de67c5e5f48ac930995279ed44b042"
    end
  end

  def install
    bin.install "gmail-ro"
  end

  def caveats
    <<~EOS
      To set up gmail-ro:
      1. Create OAuth credentials at https://console.cloud.google.com/
      2. Save credentials to ~/.config/gmail-ro/credentials.json
      3. Run: gmail-ro search "test" to authenticate

      See https://github.com/open-cli-collective/gmail-ro#setup for detailed instructions.
    EOS
  end

  test do
    assert_match "gmail-ro", shell_output("#{bin}/gmail-ro --help")
  end
end
