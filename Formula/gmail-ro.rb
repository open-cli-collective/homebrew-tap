class GmailRo < Formula
  desc "Read-only command-line interface for Gmail"
  homepage "https://github.com/open-cli-collective/gmail-ro"
  license "MIT"
  version "1.0.14"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_arm64.tar.gz"
      sha256 "154532afb09733c4e58a145d36110c59886716faede3e347aeaaf5a79c6d2e7d"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_amd64.tar.gz"
      sha256 "6ef4167165f50739d7770651cd7cb14581d8cf4175952d053184f5a728b909b5"
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
