cask "swiftmarkdown" do
  version "0.1.22"
  sha256 "a3db60f5fab9c19454065f649607864bc0b6ff4723c0ec59e8c210a096e6296c"

  url "https://github.com/open-cli-collective/SwiftMarkdown/releases/download/v#{version}/SwiftMarkdown-#{version}.dmg"
  name "SwiftMarkdown"
  desc "Native macOS markdown preview with Quick Look integration and syntax highlighting"
  homepage "https://github.com/open-cli-collective/SwiftMarkdown"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "SwiftMarkdown.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/SwiftMarkdown.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/com.open-cli-collective.SwiftMarkdown",
    "~/Library/Application Scripts/com.open-cli-collective.SwiftMarkdown.QuickLook",
    "~/Library/Application Support/SwiftMarkdown",
    "~/Library/Caches/com.open-cli-collective.SwiftMarkdown",
    "~/Library/Containers/com.open-cli-collective.SwiftMarkdown",
    "~/Library/Containers/com.open-cli-collective.SwiftMarkdown.QuickLook",
    "~/Library/Preferences/com.open-cli-collective.SwiftMarkdown.plist",
  ]
end
