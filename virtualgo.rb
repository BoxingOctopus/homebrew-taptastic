class Virtualgo < Formula
  desc "Virtualgo: Easy and powerful workspace based development for go"
  homepage "https://github.com/GetStream/vg"
  url "https://github.com/GetStream/vg/releases/download/v0.9.0/vg-darwin-amd64"
  sha256 "9631e44c1b274b059fe2d03bcc70237eb936af4764eed14553e7869a55facc88"

  def install
    bin.install "vg-darwin-amd64"
    system "mv #{bin}/vg-darwin-amd64 #{bin}/vg"
  end

  test do
    shell_output("stat #{bin}/vg", 1)
  end
end
