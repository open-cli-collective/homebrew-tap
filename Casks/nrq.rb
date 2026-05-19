cask "nrq" do
  name "nrq"
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  version "1.0.38"

  binary "nrq"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "2737fba77b8fadbf20098b960fc75bb9a111a1666ad0548fe978ca41573f0f7c"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "36c8a75f94d34c010349cf93d442980e1e620ed5b789e91920838f02a2a98b42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_arm64.tar.gz"
      sha256 "75d8834470793d78b9cfa81d45ab20f8ddd764a8b1c0101625efd4d37e1f12bb"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_amd64.tar.gz"
      sha256 "ab9e54233eb037a34e8ec3dc8475694a8b4dcc235528b043bc9cf7edde025c27"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/nrq"]
  end

  caveats <<~EOS
    nrq has been installed.

    To configure, run:
      nrq config set-api-key
      nrq config set-account-id

    Or set environment variables:
      export NEWRELIC_API_KEY=NRAK-xxx
      export NEWRELIC_ACCOUNT_ID=123456
  EOS
end
