# typed: false
# frozen_string_literal: true

class SwiftmarkdownGrammars < Formula
  desc "Tree-sitter grammars for SwiftMarkdown syntax highlighting"
  homepage "https://github.com/open-cli-collective/apple-tree-sitter-grammars"
  url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/manifest.json"
  sha256 "44cd7edf1bc5c2f16b1593c7aebfc14f400e89dfc9ef66bb6c24f15810b4fa2a"
  license "MIT"

  # When updating version, update url, sha256, and all resource URLs/checksums.
  # Use: curl -sL "<url>" | shasum -a 256

  resource "bash" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/bash.tar.gz"
    sha256 "7a46bd82a35d681a380e76bb30c2bb37bcf5dbd6bd0d37b21900bfbedda5cc16"
  end

  resource "c" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/c.tar.gz"
    sha256 "513ac7e11cbc1e261ecaf8cafb583be9c4494f2fde18ee61a2303cacf3b80495"
  end

  resource "c_sharp" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/c_sharp.tar.gz"
    sha256 "8574b7ea5ca7f6f35f497fd20d11a93484fa7fd48d1c68b0fb59cc4936860b34"
  end

  resource "cpp" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/cpp.tar.gz"
    sha256 "4615dcb812e0c3fed08d49051e48ff8a3439da8201c6432699951bf9e100d083"
  end

  resource "css" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/css.tar.gz"
    sha256 "190c557fd89d46c785ddc9ccb785ed8a9873beda0dcdca0a683759fb80938a79"
  end

  resource "go" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/go.tar.gz"
    sha256 "3fd167a6ac6b5315f9774c2af143722a94efe5ce540d93c241f4ec141f3fe389"
  end

  resource "html" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/html.tar.gz"
    sha256 "363f014aff8a271e42177f73bcd728d1a79d512dbaf71e26a4cca1d022930088"
  end

  resource "java" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/java.tar.gz"
    sha256 "021eb22ad7c923aca32868a8854d9dad080ee09053bc529f9e8ff787c3fc108c"
  end

  resource "javascript" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/javascript.tar.gz"
    sha256 "d812734b5004b611708297c6df116f26e3faa098990095326ace3cd119bf5372"
  end

  resource "json" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/json.tar.gz"
    sha256 "0fe2b933055e2f11a01eeab08fdf8ae98cbb9e915d8a7e896452784b10992117"
  end

  resource "markdown" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/markdown.tar.gz"
    sha256 "cd6bd2bc992617bc6852fd64a261a37d9784fe0eaf3c7d13cedaf3dc06532205"
  end

  resource "perl" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/perl.tar.gz"
    sha256 "d93ad95806649a6b28d67034f0ab6e457b8a189e6ee403c35ea13202c4efe89c"
  end

  resource "php" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/php.tar.gz"
    sha256 "7c42ae10f130e376fec5d722024964673c749d6df3a64314370530348dc19398"
  end

  resource "python" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/python.tar.gz"
    sha256 "2da4b2ad58a24a4a98d593443d8446d1ea387120312385d6d35da9201e169f38"
  end

  resource "rust" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/rust.tar.gz"
    sha256 "2717b9b11609977abcbff8f60428548e961f841c95aac4cfd8e84c0871387f26"
  end

  resource "swift" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/swift.tar.gz"
    sha256 "a43a11a0363d9981f67e389383ae8cad53dfd4c1277ad7b57176473c932546ae"
  end

  resource "typescript" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/typescript.tar.gz"
    sha256 "e08dd954f85c9687a2d84c29831bd9c1d308e7235273f388ef23d92c7b8e33c3"
  end

  resource "yaml" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/yaml.tar.gz"
    sha256 "656ea6e1098bc89f9f76d7100f9f6ce24d4c863ab8eb7528a66e3ec9cc086af1"
  end

  def install
    resources.each do |r|
      r.stage do
        (share/"swiftmarkdown-grammars"/r.name).install Dir["*"]
      end
    end
  end

  def caveats
    <<~EOS
      Tree-sitter grammars installed to:
        #{share}/swiftmarkdown-grammars

      SwiftMarkdown will automatically discover these grammars.

      Included languages:
        bash, c, c_sharp, cpp, css, go, html, java, javascript,
        json, markdown, perl, php, python, rust, swift, typescript, yaml

      Additional grammars can be downloaded via the SwiftMarkdown app.
    EOS
  end

  test do
    assert_path_exists share/"swiftmarkdown-grammars/swift/swift.dylib"
    assert_path_exists share/"swiftmarkdown-grammars/python/python.dylib"
    assert_path_exists share/"swiftmarkdown-grammars/javascript/javascript.dylib"
  end
end
