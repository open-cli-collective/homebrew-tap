cask "slack-chat-cli" do
  name "slack-chat-cli"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.42"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "e34dc02a8528c830d6964aa2fb8455c6d3cc14c514c3037f1d125abd35c5b405"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "6118204dc90633d87b52b75ebd73be4bc3a2a5b91c5a5f71a217e0cd2bc52834"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "3970266543da587883f3862f2c67c1f396316bb285e220352c209e62682be385"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "0534af527dc54503a384082eeb657e4d6850d57ce44b2e200661b45fd2dd06ef"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/slck"]
  end

  caveats <<~EOS
    To configure slck, run:
      slck config set-token

    On macOS, your token is stored securely in the system Keychain.
    On Linux, your token is stored in ~/.config/slack-chat-api/credentials.
  EOS
end
