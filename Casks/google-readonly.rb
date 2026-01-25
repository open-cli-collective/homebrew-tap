cask "google-readonly" do
  name "google-readonly"
  desc "Read-only command-line interface for Google services"
  homepage "https://github.com/open-cli-collective/google-readonly"
  version "1.0.22"

  binary "gro"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_arm64.tar.gz"
      sha256 "2cd487432d9dc81e34c895d26b014050facbf82411279903951513afeccaa824"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_darwin_amd64.tar.gz"
      sha256 "7f99f02fc235676861c28e16fb5a3b93ff357aaec00dabc17c26845154d1cfc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_arm64.tar.gz"
      sha256 "a570decddc08e247c6691b12a08724ac10e92250a81482ef14f245f4b752085e"
    end
    on_intel do
      url "https://github.com/open-cli-collective/google-readonly/releases/download/v#{version}/gro_v#{version}_linux_amd64.tar.gz"
      sha256 "9eda4d461d70e7bdc245b107552fbcb980e1d6d40ce7a0491660eb1a784265d0"
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
