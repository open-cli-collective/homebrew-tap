cask "slack-chat-api" do
  name "slack-chat-api"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.12"

  binary "slack-chat-api"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "bc40fe72f7d7773b3f738ab5a2fff9c4f655b3a8224a8a94d2b40037d0325834"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "2fb98a90a586e89ac09d122578749919cfcc8cd36def6eb3751e9bb099990d77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_arm64.tar.gz"
      sha256 "aa5ebd57b4a162c7e9430583fda07b32691863a2d27fe3025da6782a44dd3603"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_amd64.tar.gz"
      sha256 "2313fed17d336b890fc2290c500e2426d1a0c578ac35fcc8388ce2a90b954654"
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
