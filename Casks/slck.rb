cask "slck" do
  name "slck"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.39"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "30e95c7ca6a2fecd919665572c2f077c1f2837053920f04a8b2a80ccbcc1d21d"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "d6b83e4860015ab6c460e5b0206bead80a7733ba35faaba1df38254817119b3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "47fe48675f44a30139c585230bc5ed83fd285cace8bdaf78bd3e05ef45d2d7f3"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "de2da19beacfe8f02eba0be267cf1dfe0f6d70117a45a4a598d03f97a84b177c"
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
