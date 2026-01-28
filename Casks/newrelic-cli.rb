cask "newrelic-cli" do
  version "1.0.11"

  name "newrelic-cli"
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"

  binary "newrelic-cli"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "7956d5a2bd5193df5c5954e490857447b166e6aba243d14f05c8773fa47510af"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "d6bf840be6e4a6d0987e6578f48efea1e2be8faa4b412ecaf1678bbfd9b873b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "c4c07b9a8c1526016851fa36c922f43c76b498f7f1301b0ddcd09a93403e216e"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "2e6c2bbf498edf3f772ae343fea3149e2dbd42af7090d1f41ebddb645874126b"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/newrelic-cli"]
  end

  caveats <<~EOS
    To configure newrelic-cli, run:
      newrelic-cli config set-api-key
      newrelic-cli config set-account-id

    Or set environment variables:
      export NEWRELIC_API_KEY=NRAK-xxx
      export NEWRELIC_ACCOUNT_ID=123456
  EOS
end
