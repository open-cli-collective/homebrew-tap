cask "retune" do
  version "0.2.1"
  sha256 "a23e04f7cc2bcfa26c04bd3948393eff00336d9c031286b34912978131dd2dce"

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
