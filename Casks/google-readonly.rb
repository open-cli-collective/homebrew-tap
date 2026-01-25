cask "google-readonly" do
  name "google-readonly"
  desc "Read-only command-line interface for Google services"
  homepage "https://github.com/open-cli-collective/google-readonly"
  version "1.0.20"

  binary "gro"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_arm64.tar.gz"
      sha256 "3cdec76d6bd0d7c0344146329c5305d95cf234d0e418cbe83484d9b960de46dd"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_amd64.tar.gz"
      sha256 "4d97be43749b39aba4f399042dd8167a7f2c0c174a281bb2996937538193a918"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_arm64.tar.gz"
      sha256 "acc113ecfe33b5964c92e7eb05a25ee1b1a7ca918be8f44589bd4d8f78ec1907"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_amd64.tar.gz"
      sha256 "0fc547792096910942a8c488d9c34da0870cef4ae7ef81cc0c1b527c4c517fe1"
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
