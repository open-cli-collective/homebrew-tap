cask "retune" do
  version "0.2.0"
  sha256 "4673d550b364b1af0969dd1f13f76751a77ed095435b0d41ed59d95af1aee3db"

  url "https://github.com/open-cli-collective/Retune/releases/download/v#{version}/Retune-#{version}-aarch64.tar.gz"
  name "Retune"
  desc "Album-first music library for local audio and Spotify"
  homepage "https://github.com/open-cli-collective/Retune"

  app "Retune.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Retune.app"]
  end

  caveats <<~EOS
    Retune is stable-signed with the Open CLI Collective certificate but is not notarized.
    The first access to stored Spotify credentials after upgrading from an older ad-hoc build
    may show one macOS Keychain prompt. Choose Always Allow once; later stable-signed updates
    keep the same identity and do not prompt again.
  EOS
end
