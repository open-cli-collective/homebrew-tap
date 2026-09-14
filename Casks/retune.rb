cask "retune" do
  version "0.3.14"
  sha256 "c073d9810d868eb56a35ca6db6f69760709c5c4ba50cdd39d06d15b8f79df360"

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
