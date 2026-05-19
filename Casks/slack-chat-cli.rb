cask "slack-chat-cli" do
  name "slack-chat-cli"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.49"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "85e3aec02dfe882b7aad926850deac8f91983cb61a0bd832061d49383f89a048"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "732d973b44182d520890ed8bb06ee27067f0d0f82326a904c6bb82aeb74e0d20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "ac9ed8ffbb9b6b0c91929a927be56553a985364371a73204efd6bbfeed487002"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "18928583e0578324ad10683ce9cc21f10aa52dd93b88df06644b4e5402adf073"
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
