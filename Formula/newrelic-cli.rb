class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.34"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "d4036964600285bf95200b63452248bbf7d64dc73188eb8814129fda8f2961d7"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "da03fd869a067cbabb902ae5b9efde2ad577f87b86e76f4cabc8a5134008c52c"
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
