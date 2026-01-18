class GmailRo < Formula
  desc "Read-only command-line interface for Gmail"
  homepage "https://github.com/open-cli-collective/gmail-ro"
  license "MIT"
  version "1.0.12"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_arm64.tar.gz"
      sha256 "510ff6aee144e79c05b0c5806265e33cbbd81d29d7e89605cddda72620c97068"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_amd64.tar.gz"
      sha256 "d7122443d512d23c25cfb7237a5d772d488a42966065883d166e5992c5eef2b6"
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
