cask "retune" do
  version "0.3.25"
  sha256 "1a2c0c1df0585c64f814f5ede69d7b9545bfe08211af410a638f09f1651299dc"

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
