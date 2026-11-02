cask "retune" do
  version "0.3.22"
  sha256 "c69f5d9394b42eff4e885ef379ba8241213e907b0e3e916caae4385eb0ac6e48"

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
