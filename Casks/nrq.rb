cask "nrq" do
  name "nrq"
  desc "Command-line interface for New Relic"
  homepage "https://github.com/open-cli-collective/newrelic-cli"
  version "1.0.29"

  binary "nrq"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_arm64.tar.gz"
      sha256 "1a4989513aef748b1b49f931a493bb6761bb54689470f99f89b5191add38851d"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_darwin_amd64.tar.gz"
      sha256 "6181fc679e578aae93af9d6b3767b3d4a114c063a7cb54a1c01bdbf52548743b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_arm64.tar.gz"
      sha256 "ce577aa12b60b82824cfe9a0bf76131993366c8e3c00276cedf2fb2ccdaf06d5"
    end
    on_intel do
      url "https://github.com/open-cli-collective/newrelic-cli/releases/download/v#{version}/nrq_v#{version}_linux_amd64.tar.gz"
      sha256 "7cdd7350da0b9468eaf8d4166f09e52d78fbeefd1e03d54a4b40258cc07629a5"
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
