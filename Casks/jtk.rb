cask "jtk" do
  name "jtk"
  desc "Command-line interface for Jira Cloud"
  homepage "https://github.com/open-cli-collective/jira-ticket-cli"
  version "0.1.20"

  binary "jtk"

  on_macos do
    on_intel do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jtk_#{version}_darwin_amd64.tar.gz"
      sha256 "5c9c6ea728eb3da4cda69affbcbeef0e79aeb7686e1d280be4662663cf953b5c"
    end
    on_arm do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jtk_#{version}_darwin_arm64.tar.gz"
      sha256 "623bdaa20b9c6594f2a982c4e68d0648ed9396644f780b0b0730559e541c02fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jtk_#{version}_linux_amd64.tar.gz"
      sha256 "ff28d2a45d4c63d6a955a4e8248a2b6230f8b3a769b3fef22c80016dcc73162d"
    end
    on_arm do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jtk_#{version}_linux_arm64.tar.gz"
      sha256 "d83173304e1712e7f4442af377bc48e1d868b40e39bf865e4318b2c572283357"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/jtk"]
  end

  caveats <<~EOS
    jtk has been installed.

    To configure, run:
      jtk config set --domain DOMAIN --email EMAIL --token TOKEN

    Get your API token from: https://id.atlassian.com/manage-profile/security/api-tokens
  EOS
end
