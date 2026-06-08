cask "qlmarkdown2" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/open-cli-collective/QLMarkdown2/releases/download/v#{version}/QLMarkdown.zip"
  name "QLMarkdown2"
  desc "Quick Look generator for Markdown files"
  homepage "https://github.com/open-cli-collective/QLMarkdown2"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "QLMarkdown.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/QLMarkdown.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/org.sbarex.QLMarkdown",
    "~/Library/Application Scripts/org.sbarex.QLMarkdown.QLExtension",
    "~/Library/Containers/org.sbarex.QLMarkdown",
    "~/Library/Containers/org.sbarex.QLMarkdown.QLExtension",
    "~/Library/Group Containers/org.sbarex.qlmarkdown",
    "~/Library/Preferences/org.sbarex.QLMarkdown.plist",
  ]
end
