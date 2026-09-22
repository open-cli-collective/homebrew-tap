cask "retune" do
  version "0.3.16"
  sha256 "6c401b6a5350e51ec7fb36f3a6b16675a5ff34a16c1c6bb4389a94bf29042499"

  url "https://github.com/open-cli-collective/Retune/releases/download/v#{version}/Retune-#{version}-aarch64.zip"
  name "Retune"
  desc "Album-first music library for local audio and Spotify"
  homepage "https://github.com/open-cli-collective/Retune"

  depends_on macos: :sequoia

  app "Retune.app"

  caveats <<~EOS
    Retune uses the Open CLI Collective's self-signed certificate and is not Apple-notarized.
    After Homebrew verifies the cask checksum, try to open Retune, then choose Open Anyway in Privacy & Security.
  EOS
end
