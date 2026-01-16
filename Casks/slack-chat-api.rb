cask "slack-chat-api" do
  name "slack-chat-api"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.8"

  binary "slack-chat-api"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "545f9c0212cca3a488a4747322f669e0aef69fa486a22c16e3122c19455ef89c"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "8747869ec52b6419523154859e58f1fcfed67a4ed6f2131deecd565f9ddff24b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_arm64.tar.gz"
      sha256 "e43dad4eb73b655125bbdc46a9f5060984964c32a9b011d3c111ce03c04d4122"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_amd64.tar.gz"
      sha256 "3e93ad54c745418081f98d573555d7d2b5974775e7242dd7c3bbb44e0937cfa2"
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
