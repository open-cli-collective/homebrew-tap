class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.13"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "84b92a73ee5cb533f613a5adce3277a8909c8e5391c8b4e469d1458f917e08ad"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "d8fd1c0fd078ba7744aa47483a76c9ec241602be7d1231637caed417cdb1b183"
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
