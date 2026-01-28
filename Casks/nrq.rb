cask "nrq" do
  name "nrq"
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  version "1.0.26"

  binary "nrq"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "df683316e79d0f87d8a906d514399f87b6b50282e65eda9fed9895ed330fae4a"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "22618201a6b1511b587fdee4929849ec7f42f9a67cee350999643fd4a8fdb68b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_arm64.tar.gz"
      sha256 "668963342cff649c67b8f01408437fddbf82533ab76a37280c786eea1e3a4338"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_amd64.tar.gz"
      sha256 "2d37d734498ad35a209e5520770aa852b071022e0a3ed8671e34673c4e776ede"
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
