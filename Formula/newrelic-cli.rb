class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.20"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "bbb883d37e84bc622e8b05a1aef6404de47feeca083e375ea125f59fc2823fca"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "96ef08b17cb713a3a715c245083b6db1107df036eb0d4a278d61c4f5a2081f75"
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
