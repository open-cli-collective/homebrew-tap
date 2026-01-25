cask "google-readonly" do
  name "google-readonly"
  desc "Read-only command-line interface for Google services"
  homepage "https://github.com/open-cli-collective/google-readonly"
  version "1.0.23"

  binary "gro"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_arm64.tar.gz"
      sha256 "050a33a5e26c6dcd0d07ed17589fceb81eda5beca773cf5b3707019abce7392d"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_amd64.tar.gz"
      sha256 "b90784165e38bad242563fd61870a9796a0a3ba9f3402fb4e685a3f3b0d38df2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_arm64.tar.gz"
      sha256 "55e9995f04bf065d289fcf9dcce68afb9c928aecf07e8037b0618003b7085e41"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_amd64.tar.gz"
      sha256 "66446a7d2c43f89ac55c5bf9370676fdcc77379eece6b4d93a6e43da344b7d8b"
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
