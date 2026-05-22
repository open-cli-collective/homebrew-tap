class KittyThemes < Formula
  desc "Collection of themes for the kitty terminal emulator"
  homepage "https://github.com/open-cli-collective/kitty-themes"
  url "https://github.com/open-cli-collective/kitty-themes/archive/refs/tags/v2.0.9.tar.gz"
  sha256 "fef091f650047bb47bf773086932bc977dffa1bba41eaa99315b69e2061bb5f0"
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
