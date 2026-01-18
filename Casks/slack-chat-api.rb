cask "slack-chat-api" do
  name "slack-chat-api"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.15"

  binary "slack-chat-api"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "e2987921ad0505c628ac9724f8b18ddae410162b4e9ea5f48bcdd018ae2fce70"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "aba04a303fd70a2c0e232667dfb6f5045907fd309d9f0c49628d089ddeeeb0f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_arm64.tar.gz"
      sha256 "be55ba23b0290e89b22ac6fa91f49c282853eaf9e1f874a183d9e04423b3d8aa"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_amd64.tar.gz"
      sha256 "4659459a639b2f26b8d9f431acab6f5c04a9786ca21e0b4ae6a7a59f7602b713"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/slack-chat-api"]
  end

  caveats <<~EOS
    To configure slack-chat-api, run:
      slack-chat-api config set-token

    On macOS, your token is stored securely in the system Keychain.
    On Linux, your token is stored in ~/.config/slack-chat-api/credentials.
  EOS
end
