class KittyThemes < Formula
  desc "Collection of themes for the kitty terminal emulator"
  homepage "https://github.com/open-cli-collective/kitty-themes"
  url "https://github.com/open-cli-collective/kitty-themes/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "d067c29f7b61289d17633a2f57ce2542bc0a835e9744ad88a2144dcf2f35cc83"
  license "MIT"

  def install
    pkgshare.install Dir["themes/*.conf"]
  end

  def caveats
    <<~EOS
      Themes installed to:
        #{pkgshare}

      To use a theme, add to your kitty.conf:
        include #{pkgshare}/Dracula.conf

      Or apply temporarily (requires remote control):
        kitty @ set-colors -a "#{pkgshare}/Dracula.conf"

      List available themes:
        ls #{pkgshare}
    EOS
  end

  test do
    assert_predicate pkgshare/"Dracula.conf", :exist?
  end
end
