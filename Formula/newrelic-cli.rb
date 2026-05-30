class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.47"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "a9fbe04e9321bd04cc79db81d7c410131ab694fe0f4b358f2c6f48bbc2439400"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "ac506681a6b0b754d26cb83c9c831e4fe583c7780c0ee1509a1c3d2caa5c4630"
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
