cask "google-readonly" do
  name "google-readonly"
  desc "Read-only command-line interface for Google services"
  homepage "https://github.com/open-cli-collective/google-readonly"
  version "1.0.9"

  binary "gro"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_arm64.tar.gz"
      sha256 "354fdc45b8fc4808e90a1e172ee04bd2ee1e0367f7d708d7d84507520bef30c3"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_amd64.tar.gz"
      sha256 "4ed45a8bf03286265655148b1c3bb29d19c9f42585dd56c1f3c9ac113a62d30b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_arm64.tar.gz"
      sha256 "4975ae0903de0889e501b6b5f8d2327adc03d7754601eb4006a88677cbd22ac6"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_amd64.tar.gz"
      sha256 "95a811b8355947fdf10034306e3ae0be5a7c1c223a2db3d0984f152a4e74a398"
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
