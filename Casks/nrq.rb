cask "nrq" do
  name "nrq"
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  version "1.0.33"

  binary "nrq"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "b83695e4bdd69f017aa1f351424cb3336d5a4aaf677582420533b2413d710884"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "92df793a68b6229ddc9a2140d07e4cbcc6268601dbd343ee16e0edf6a1641d26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_arm64.tar.gz"
      sha256 "6e60b8d6b60bd8597a90d3a989c10600befc247ee1595b0da45574c5fc806b5d"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_amd64.tar.gz"
      sha256 "e241968ec08a6d5762f50f485997346e9232db8496dd3bcbf84045fc779b0856"
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
