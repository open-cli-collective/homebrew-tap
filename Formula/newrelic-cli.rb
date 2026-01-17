class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.16"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "52d47a46bffc4d2715544c785fd168c9809ccd05fc18769a9d586b9656faf294"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "d9e67ca88a0c150edf3d5abdfda98e923b883fcc9afd893d8b3029f7d47c49ab"
    end
  end

  def install
    bin.install "newrelic-cli"
  end

  def caveats
    <<~EOS
      To configure newrelic-cli, run:
        newrelic-cli config set-api-key
        newrelic-cli config set-account-id <your-account-id>

      Or set environment variables:
        NEWRELIC_API_KEY
        NEWRELIC_ACCOUNT_ID
        NEWRELIC_REGION (US or EU)
    EOS
  end

  test do
    assert_match "newrelic-cli", shell_output("#{bin}/newrelic-cli --help")
  end
end
