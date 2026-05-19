cask "slack-chat-cli" do
  name "slack-chat-cli"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.48"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "5b70b088318b09a674a13268a122ce79b1bd8438580e45e31f4edaf3af39bd54"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "0a074f9ebf5ed3b06cea0c5379c935cfc2b90d9c1ae6a07075f16c8424520f31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "74e042a967e1392c4240c4960d2aa74a0a2dd36b4b8d3f2454b19196ec1d3fc3"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "5393620829bf9bae917f018e29e2c96369d0126aa09f5244eb902bf8b039e224"
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
