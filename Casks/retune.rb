cask "retune" do
  version "0.3.3"
  sha256 "854ce5e4d563baa18e67812b9db5fdb0a6f58d52e9d342219fa914fdfd578e19"

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
