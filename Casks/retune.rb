cask "retune" do
  version "0.3.26"
  sha256 "38f97e922fd23f585620b6f247e470c17191a698735fb108f4a6ff598de0ec46"

  url "https://github.com/open-cli-collective/Retune/releases/download/v#{version}/Retune-#{version}-aarch64.zip"
  name "Retune"
  desc "Album-first music library for local audio and Spotify"
  homepage "https://github.com/open-cli-collective/Retune"

  depends_on macos: :sequoia

  app "Retune.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Retune.app"]
  end

  caveats <<~EOS
    Retune uses the Open CLI Collective's self-signed certificate and is not Apple-notarized.
    Homebrew removes quarantine from Retune after verifying the cask checksum on install and upgrade.
  EOS
end
