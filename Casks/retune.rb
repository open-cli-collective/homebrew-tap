cask "retune" do
  version "0.3.15"
  sha256 "633595bfa8fa62407fa07ec14ad7397a65d834f48fdf8d10a7ce8db53058bd48"

  url "https://github.com/open-cli-collective/Retune/releases/download/v#{version}/Retune-#{version}-aarch64.zip"
  name "Retune"
  desc "Album-first music library for local audio and Spotify"
  homepage "https://github.com/open-cli-collective/Retune"

  app "Retune.app"

  caveats <<~EOS
    Retune uses the Open CLI Collective's self-signed certificate and is not Apple-notarized.
    After Homebrew verifies the cask checksum, try to open Retune, then choose Open Anyway in Privacy & Security.
  EOS
end
