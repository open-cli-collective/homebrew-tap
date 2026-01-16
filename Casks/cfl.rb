cask "cfl" do
  version "0.8.0"
  license "MIT"

  name "cfl"
  desc "Command-line interface for Atlassian Confluence"
  homepage "https://github.com/open-cli-collective/confluence-cli"

  binary "cfl"

  on_macos do
    on_arm do
      url "https://github.com/open-cli-collective/confluence-cli/releases/download/v#{version}/cfl_#{version}_darwin_arm64.tar.gz"
      sha256 "098d61bd941a423a3a595d6a6a9fbcedace69583b0f1b40da5baa707760993ad"
    end
    on_intel do
      url "https://github.com/open-cli-collective/confluence-cli/releases/download/v#{version}/cfl_#{version}_darwin_amd64.tar.gz"
      sha256 "3176ecca3396c07fc178cb9cdafcd3014c821cf67489cb772af9e7d05e0ef4b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-cli-collective/confluence-cli/releases/download/v#{version}/cfl_#{version}_linux_arm64.tar.gz"
      sha256 "1a48ebfd04678683c5e0cd41d5db80faa4604c9084a15db21b4f3cd51fa9b13c"
    end
    on_intel do
      url "https://github.com/open-cli-collective/confluence-cli/releases/download/v#{version}/cfl_#{version}_linux_amd64.tar.gz"
      sha256 "f4e3a202b3e054236946778a768f546ec0f1cf50b8cea0c37813cbfbf019dfb2"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/cfl"]
  end

  caveats <<~EOS
    To configure cfl, run:
      cfl init

    This will prompt for your Confluence URL, email, and API token.
  EOS
end
