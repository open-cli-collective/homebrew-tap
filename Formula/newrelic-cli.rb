class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.23"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "29b9fb037af26fb544d1b418a6c2b2ad56025fe405774738b82204a8146f972f"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "680771a80a43ed98a4666ee6456947d894d8d3245c931aca78a245a36b62f171"
    end
  end

  def install
    bin.install "nrq"
  end

  def caveats
    <<~EOS
      To configure nrq, run:
        nrq config set-api-key
        nrq config set-account-id <your-account-id>

      Or set environment variables:
        NEWRELIC_API_KEY
        NEWRELIC_ACCOUNT_ID
        NEWRELIC_REGION (US or EU)
    EOS
  end

  test do
    assert_match "nrq", shell_output("#{bin}/nrq --help")
  end
end
