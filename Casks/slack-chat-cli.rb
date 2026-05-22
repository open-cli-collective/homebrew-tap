cask "slack-chat-cli" do
  name "slack-chat-cli"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.51"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "63183948692472eae71ff893aaf900144af9782ef155e47dddaf45fd526e1d2f"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "410586a29aa3111ce389db64e75f5b59af55c2ab91583371fe26963b8d977632"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "8c55747980a2c7f117ccad3cada06de0145016e9577c82d38f8372019cb4bc58"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "9194470a1a617e8e78ace75116b3acd316ed73ae0b7bfd6f698cb032d442b56a"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/slck"]
  end

  caveats <<~EOS
    To configure slck, run:
      slck init

    Tokens are stored in the OS keyring (Keychain on macOS,
    Credential Manager on Windows, Secret Service on Linux).
    They are never written to a plaintext file.
  EOS
end
