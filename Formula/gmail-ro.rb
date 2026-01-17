class GmailRo < Formula
  desc "Read-only command-line interface for Gmail"
  homepage "https://github.com/open-cli-collective/gmail-ro"
  license "MIT"
  version "1.0.9"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_arm64.tar.gz"
      sha256 "efa842bbaa9334e95b0a9c178be0b32d710d88f8fa859a205a0da72c96955d07"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_amd64.tar.gz"
      sha256 "8a9eed8a51f49115ad8e60bafeae871fbbcc4af83f25777040835b7a901f3343"
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
