class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  license "MIT"
  version "1.0.36"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "c9a68d658cf184ea5cc0be11e9da40cc84ed443a561cd2ff03ac9502b6ea0c34"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "6a26f60d95a0ba9d23b73e23e152f997ed41edcbb6640be1b9d4c5a865ab647c"
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
