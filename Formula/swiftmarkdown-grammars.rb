# typed: false
# frozen_string_literal: true

class SwiftmarkdownGrammars < Formula
  desc "Tree-sitter grammars for SwiftMarkdown syntax highlighting"
  homepage "https://github.com/open-cli-collective/apple-tree-sitter-grammars"
  url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/manifest.json"
  sha256 "44cd7edf1bc5c2f16b1593c7aebfc14f400e89dfc9ef66bb6c24f15810b4fa2a"
  license "MIT"

  # When updating version, update url, sha256, and all resource URLs/checksums.
  # Checksums available in bundled-manifest.json from the release.

  resource "bash" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/bash.tar.gz"
    sha256 "a076e9ab9f23527428deb5527678d98fd8f77c75a28692d7f441584797413705"
  end

  resource "c" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/c.tar.gz"
    sha256 "9f4cbc2385850ee24ce363cd42d976d0f9a2aae5505a66096499b59f2e5d713a"
  end

  resource "c_sharp" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/c_sharp.tar.gz"
    sha256 "3eddab51e4868bcd693154d3b73f0c4a727ddf2e40fea4152009185dff846ec1"
  end

  resource "cpp" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/cpp.tar.gz"
    sha256 "0fbc311a1b1eb1e4bbe84dccececebbb8b4b894598a8781b707df9e9921f3030"
  end

  resource "css" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/css.tar.gz"
    sha256 "26f1034c30cf258652a378102257aa9d997430df35fd70f74832b69056c8cb96"
  end

  resource "go" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/go.tar.gz"
    sha256 "843bb1f02b1eb84dde6388044bfba0056aaff9b0fb60ebfab20aad228a6079c3"
  end

  resource "html" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/html.tar.gz"
    sha256 "b73ccf8a99599fbcf14d844e63d11c9c943d96df51ea6c338dfa16571587cf30"
  end

  resource "java" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/java.tar.gz"
    sha256 "10bf58840c2f8a9d9eccf070c4bd1d2b5a8bb8a81793c3bdc9586614fa277edc"
  end

  resource "javascript" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/javascript.tar.gz"
    sha256 "4fbf12bc34e58fbcafe81586788ce4dc92389d89fe505ccab3bf7b8333fa3c8e"
  end

  resource "json" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/json.tar.gz"
    sha256 "27a4fe7fa987826e2abe1d58e53f37db099b1e219950a527596aa0dbeb5d4d7f"
  end

  resource "markdown" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/markdown.tar.gz"
    sha256 "281128bf3a38fbe6f429aaf31552e997e331886a3aa195483bd3669be75c2a0c"
  end

  resource "perl" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/perl.tar.gz"
    sha256 "26b5b86cd17d421b66982d6b20e3f1f34378cd69932439c3250d40e9efc122d0"
  end

  resource "php" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/php.tar.gz"
    sha256 "baf591316776cd04658b5c99cfdb7f4c5b66b52e971d1ce163e601718d02327a"
  end

  resource "python" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/python.tar.gz"
    sha256 "e9bc45dca970a6e0f8cdb5bb03055ed6723e80dd01bdfc95d33f4bdfe78d0db9"
  end

  resource "rust" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/rust.tar.gz"
    sha256 "3b0a025aad128a4f2ad76e0c03f489ada4594785165f9491450cfbf42ed5605f"
  end

  resource "swift" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/swift.tar.gz"
    sha256 "937a53a4d2ef4e1ad3363719a2799c8c979d5af43bd5a173605a23311d8d2590"
  end

  resource "typescript" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/typescript.tar.gz"
    sha256 "03960e0be4554ffd1c969e2e180ba316acab132f0e35dc7120f6f1aae0351561"
  end

  resource "yaml" do
    url "https://github.com/open-cli-collective/apple-tree-sitter-grammars/releases/download/v2.0.44/yaml.tar.gz"
    sha256 "038a1c3298223455a30ef2ba4758c4190446851c17a9c861446a546e432c8b8f"
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
