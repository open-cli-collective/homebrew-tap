cask "slack-chat-api" do
  name "slack-chat-api"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.14"

  binary "slack-chat-api"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "17c67564983fd18164a8c211d2ec3546a117f036db370add4a547d92a6d0fba2"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "6a7c809192220a1cd44681d0fe3a2bceab658cb09355d26e042f5fdcc3de937b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_arm64.tar.gz"
      sha256 "96ffd61ab7f98f0eca11a44b0849513baddb9c3ce4cb542e7a9ad4ef6d520125"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slack-chat-api_v#{version}_linux_amd64.tar.gz"
      sha256 "35917e80a673b211bfc53111b6ab30c7381728ca3302f179c06c91b1b0562630"
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
