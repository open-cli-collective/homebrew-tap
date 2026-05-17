cask "slck" do
  name "slck"
  desc "Command-line interface for Slack"
  homepage "https://github.com/open-cli-collective/slack-chat-api"
  version "3.1.47"

  binary "slck"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_arm64.tar.gz"
      sha256 "cca5d4765d2a1693365f4c1bda4d475b3027780a19cb4a745ac1d7510e961030"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_darwin_amd64.tar.gz"
      sha256 "e5d0ce42284af41375b4bb839f013a543230c8d3280c874a046e25fa35f925cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_arm64.tar.gz"
      sha256 "329f1490a70ec8924c261f554bec6ebe866cc615981008562abdc7d516b872c8"
    end
    on_intel do
      url "https://github.com/open-cli-collective/slack-chat-api/releases/download/v#{version}/slck_v#{version}_linux_amd64.tar.gz"
      sha256 "74c2265ff76b1f22f90b95c020bf109c96041d0f15b172673abdb443613acaed"
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
