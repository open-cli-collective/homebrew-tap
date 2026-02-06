cask "jtk" do
  name "jtk"
  desc "Command-line interface for Jira Cloud"
  homepage "https://github.com/open-cli-collective/atlassian-cli"
  version "0.2.0"

  binary "jtk"

  on_macos do
    on_intel do
      url "https://github.com/open-cli-collective/atlassian-cli/releases/download/v#{version}/jtk_#{version}_darwin_amd64.tar.gz"
      sha256 "fd4d91cefb28dd53ec301616ffc7eb5822ef98ea030536588e22368db0aa8c5a"
    end
    on_arm do
      url "https://github.com/open-cli-collective/atlassian-cli/releases/download/v#{version}/jtk_#{version}_darwin_arm64.tar.gz"
      sha256 "8e1fcff1600696fa2c8cd024a4264bd7af0b97567a69c8b18fd5015c327085d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/open-cli-collective/atlassian-cli/releases/download/v#{version}/jtk_#{version}_linux_amd64.tar.gz"
      sha256 "d45102227ba369086ca4e618c4a35b593177acf98b065e7c846f90f9c1daac5e"
    end
    on_arm do
      url "https://github.com/open-cli-collective/atlassian-cli/releases/download/v#{version}/jtk_#{version}_linux_arm64.tar.gz"
      sha256 "f06141c1289026c27b8e166ddb3817702f3e6dda43b6f4cdf287afe4f6174816"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/jtk"]
  end

  caveats <<~EOS
    To configure, run:
      jtk config set --domain DOMAIN --email EMAIL --token TOKEN

    Get your API token from: https://id.atlassian.com/manage-profile/security/api-tokens
  EOS
end
