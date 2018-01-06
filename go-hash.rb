class Go-hash < Formula
  desc "Small utility to store secret information like passwords"
  homepage "https://github.com/renatoathaydes/go-hash/"
  url "https://github.com/renatoathaydes/go-hash/releases/download/0.6.0/go-hash-darwin-amd64"
  sha256 "9bb416438d8c6556df65001146b53970632459801e7fdea029e88ddff64506f7"

  def install
    bin.install "go-hash-darwin-amd64"
    system "mv #{bin}/go-hash-darwin-amd64 #{bin}/go-hash"
  end

  test do
    shell_output("stat #{bin}/go-hash", 1)
  end
end
