cask "slck" do
  name "slck"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.29"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "cf600627f6ac6cd04d53131a3ad255969796c17aa57e11d098a0ca8516dccfa3"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "bfcb0772365bd780f0f7cf1da5fb844db1fb33d666d0f90c73b3f2df07b90313"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "337cfba20fb53e9156f851c1d7183ae2178958fece2142b2a9d03f1be0bf073f"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "9b777e87727cde8c9ceaf258bc227d33abcf78677e20bfb64e18493a673d0df9"
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
