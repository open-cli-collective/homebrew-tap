class KittyThemes < Formula
  desc "Collection of themes for the kitty terminal emulator"
  homepage "https://github.com/open-cli-collective/kitty-themes"
  url "https://github.com/open-cli-collective/kitty-themes/archive/refs/tags/v2.0.5.tar.gz"
  sha256 "119faab2435d7e4516b2ae374d0203dc436ff3eb20f59c3ee52fb1fdd8ccbc4a"
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
