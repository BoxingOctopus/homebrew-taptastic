class Go-hash < Formula
  desc "Small utility to store secret information like passwords"
  homepage "https://github.com/renatoathaydes/go-hash/"
  url "https://github.com/renatoathaydes/go-hash/releases/download/0.6.0/go-hash-darwin-amd64"
  sha256 "cb67c08ece570cdac599d87ad295e46b1a195213ecf18ad986b584e671cbf2c2"

  def install
    bin.install "go-hash-darwin-amd64"
    system "mv #{bin}/go-hash-darwin-amd64 #{bin}/go-hash"
  end

  test do
    shell_output("stat #{bin}/go-hash", 1)
  end
end
