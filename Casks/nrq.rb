cask "nrq" do
  name "nrq"
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  version "1.0.37"

  binary "nrq"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "103ab509a53d3794600be65c8f62243920bc918a6b3174f14ab89db97b71f6f8"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "7e68dba3ba6d3a9dddaa860c3d9e451e855e46003c9706625f13ee47f5e17408"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_arm64.tar.gz"
      sha256 "a278f77207145d152c0e468b29d4310064f611712b742ca2b37b6ff68f23555a"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_amd64.tar.gz"
      sha256 "135efca834008577d00022d433e781aa0354fbe9d7459bb7a81d527cd1d1b625"
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
