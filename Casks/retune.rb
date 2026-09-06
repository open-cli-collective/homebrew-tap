cask "retune" do
  version "0.3.11"
  sha256 "67390239a98521472b1eb354c9835d6e29670e9ddab7307774e6ae3870e09ae0"

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
