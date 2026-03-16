cask "slck" do
  name "slck"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.34"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "04a32cb0fa51b5b690194ebbff1e9a4d51155b8900a4375eceb9ac3b911f0edf"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "3c1aa4158943add638387609f69744195c0aa2758a09f9db56ad10bf441d435e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "5f88cd8f25a71d8577f0fab96d9e914bc39aaba6f702ce9aeed29d99623f057d"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "7a3d2e97a7955e871876eca66037fbe81701f918bbb20130d656be51c9f8a541"
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
