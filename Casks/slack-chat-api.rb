cask "slack-chat-api" do
  version "3.1.7"
  license "MIT"

  name "slack-chat-api"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"

  binary "slack-chat-api"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "b04482b15ae2337232d48fe70b5557da9bb5301e1f26dc4c7136cbed20dbb930"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "cb173a502dbbf1c89acfdeddd766a03f3dd39c89cd95f376c5ddbe38add7bfc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_arm64.tar.gz"
      sha256 "80c196ce973697f319184285824690cdcb8ff051c4a93001499467adcbbdd080"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_amd64.tar.gz"
      sha256 "b11e8dc7bcb8e985076557740839198b99a6edee8021dc2f993d982d933ddc11"
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
