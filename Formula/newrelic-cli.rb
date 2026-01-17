class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.15"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "882d59b561cf992dbe860e3e99bbbdb0b8b54e55f8eb4dff4a9619e1fbf71333"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "4c420f0096a1ffd7c6000bc6ce7b4b1dd5cf77ace8b35771b7a51bcc10934a7d"
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
