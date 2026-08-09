cask "retune" do
  version "0.1.0"
  sha256 "01654e90afe2418e0773f29e086838ee4d7d21821832b0c5e30177cb110eb2af"

  url "https://github.com/rianjs/Retune/releases/download/v#{version}/Retune-#{version}-aarch64.tar.gz"
  name "Retune"
  desc "Dense, album-first music library blending local files and Spotify"
  homepage "https://github.com/rianjs/Retune"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Retune.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Retune.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.rianjs.retune",
    "~/Library/Caches/com.rianjs.retune",
    "~/Library/HTTPStorages/com.rianjs.retune",
    "~/Library/Preferences/com.rianjs.retune.plist",
    "~/Library/Saved Application State/com.rianjs.retune.savedState",
    "~/Library/WebKit/com.rianjs.retune",
  ]

  caveats <<~EOS
    Retune is ad-hoc signed but NOT notarized (there is no Apple Developer ID
    behind it). macOS quarantines it on download, and Gatekeeper will report
    the app as "damaged" if the quarantine attribute is still set at launch.

    This cask clears the quarantine attribute after install. If you prefer to
    handle it explicitly, install with:

      brew install --cask --no-quarantine open-cli-collective/tap/retune

    or clear it manually:

      xattr -cr "#{appdir}/Retune.app"
  EOS
end
