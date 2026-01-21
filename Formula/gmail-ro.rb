class GmailRo < Formula
  desc "Read-only command-line interface for Gmail"
  homepage "https://github.com/open-cli-collective/gmail-ro"
  license "MIT"
  version "1.0.17"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_arm64.tar.gz"
      sha256 "53c92fbc4c572bfa97dabd895b485e15c8f1b1e0c83c6358c8fa1ef8936e240d"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_amd64.tar.gz"
      sha256 "b59880c48a8f5f6bd7935e62f4a0c4b3e84e3db92270bc77ab2f7f50d3f16ad3"
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
