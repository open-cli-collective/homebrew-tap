class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.25"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "31322c9dc15fc9ed4c796f3b143663c1d2e6502c4928547044d0387701afb988"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "902464d732e12a5a185b6ca94474789d26f43113d6635e59e1c6f343dda0118f"
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
