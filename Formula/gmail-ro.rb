class GmailRo < Formula
  desc "Read-only command-line interface for Gmail (DEPRECATED - use gro)"
  homepage "https://github.com/open-cli-collective/google-readonly"
  license "MIT"
  version "1.0.27"

  deprecate! date: "2026-01-28", because: "has been superseded by `gro` (google-readonly)"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_arm64.tar.gz"
      sha256 "63e84f8e5446a039bde3371a488547a44aaa940c81a79f031984beb58f5efd20"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_amd64.tar.gz"
      sha256 "9907a117f0a0b37ca78fd36d762f7b10662a31744eb34c6757d657e5ea4c8cd4"
    end
  end

  def install
    bin.install "gmail-ro"
  end

  def caveats
    <<~EOS
      ⚠️  gmail-ro is DEPRECATED and will be removed in a future release.

      Please migrate to gro (google-readonly):
        brew uninstall gmail-ro
        brew install gro

      gro supports Gmail and additional Google services.
      See https://github.com/open-cli-collective/google-readonly
    EOS
  end

  test do
    assert_match "gmail-ro", shell_output("#{bin}/gmail-ro --help")
  end
end
