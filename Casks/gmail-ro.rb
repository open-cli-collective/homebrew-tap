cask "gmail-ro" do
  version "1.0.6"

  name "gmail-ro"
  desc "Read-only command-line interface for Gmail"
  homepage "https://github.com/open-cli-collective/gmail-ro"

  binary "gmail-ro"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_arm64.tar.gz"
      sha256 "2dec83cd928b1d6afbf3e9e5c2f9754d05122cf55a00f528d05512bbe34f0bc3"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_darwin_amd64.tar.gz"
      sha256 "75953855828bb0037c22f95c4c61076c5dd226c6af04fa2f300bf07318f4d507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_linux_arm64.tar.gz"
      sha256 "945ef27533d39dc191d03a24b44a472298009cd0e81d6d70a6a7b9c8d51a36dd"
    end
    on_intel do
      url "https://github.com/open-cli-collective/gmail-ro/releases/download/v#{version}/gmail-ro_v#{version}_linux_amd64.tar.gz"
      sha256 "20a11553a5cfd4c50973903361bac8f3a398baf2155370768b941c2d7e8d12bf"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/gmail-ro"]
  end

  caveats <<~EOS
    To set up gmail-ro:
    1. Create OAuth credentials at https://console.cloud.google.com/
    2. Save credentials to ~/.config/gmail-ro/credentials.json
    3. Run: gmail-ro search "test" to authenticate

    See https://github.com/open-cli-collective/gmail-ro#setup for detailed instructions.
  EOS
end
