cask "retune" do
  version "0.3.19"
  sha256 "bf0bbe76aad8a38838b9ed402c8f2cc86ce88c940eaf1cdbb9cbff93b34fa120"

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
