cask "google-readonly" do
  name "google-readonly"
  desc "Read-only command-line interface for Google services"
  homepage "https://github.com/open-cli-collective/google-readonly"
  version "1.0.24"

  binary "gro"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_arm64.tar.gz"
      sha256 "1e2221c6d302d68549444d830060bfdbbd710b62f833686281d25cb4649f0310"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_amd64.tar.gz"
      sha256 "c70c5fadf9e6f5d5525ae274e2fe6fefd2c53eb5165a337af948c4b61ef6d997"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_arm64.tar.gz"
      sha256 "a79e9bb1cd20e5b5af8af862d09c1648e08a0af6d0713e3a4bc32f17291619d0"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_amd64.tar.gz"
      sha256 "418c76d2ca129a2a97e1056b75548d15033997dd0a91ebf0e763126608c32901"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/gro"]
  end

  caveats <<~EOS
    To configure gro, run:
      gro init

    This will guide you through Google OAuth setup.
    On macOS, your token is stored securely in the system Keychain.
    On Linux with libsecret, your token is stored in the secret service.
  EOS
end
