cask "jira-ticket-cli" do
  name "jira-ticket-cli"
  desc "Command-line interface for Jira Cloud"
  homepage "https://github.com/open-cli-collective/jira-ticket-cli"
  version "0.1.1"

  binary "jira-ticket-cli"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jira-ticket-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "c6721f295b649c0b1b998c2f33820d30003876766e782e5b9632cdfe6086132a"
    end
    on_intel do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jira-ticket-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "f82dbf7e644b89133b284071d829fb3941096bf8c378c9e6264bf333b077af74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jira-ticket-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "e596e66bfc5e8abab00a850b99135d42d35c599efde872e1df86e87f115e704f"
    end
    on_intel do
      url "https://github.com/open-cli-collective/jira-ticket-cli/releases/download/v#{version}/jira-ticket-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "42aefa9abac39b5b9a6c50cab36feffaaf4ecddc7a2f66b1f3f3373a869816c9"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/jira-ticket-cli"]
  end

  caveats <<~EOS
    To configure jira-ticket-cli, run:
      jira-ticket-cli config set --domain DOMAIN --email EMAIL --token TOKEN

    Get your API token from: https://id.atlassian.com/manage-profile/security/api-tokens
  EOS
end
