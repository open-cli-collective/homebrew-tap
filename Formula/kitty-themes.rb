class KittyThemes < Formula
  desc "Collection of themes for the kitty terminal emulator"
  homepage "https://github.com/open-cli-collective/kitty-themes"
  url "https://github.com/open-cli-collective/kitty-themes/archive/refs/tags/v2.0.7.tar.gz"
  sha256 "dd66a90eb5994ba95b1ca87b819b83be0f8ba96e39165046a85a0824add7d951"
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
