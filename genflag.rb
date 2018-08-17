class Genflag < Formula
  desc "Stupid little Golang binary which will generate Flags for CTF/Wargames"
  homepage "https://github.com/BoxingOctopus/genflag"
  url "https://github.com/BoxingOctopus/genflag/releases/download/v1.1/genflag-darwin-amd64"
  sha256 "394ddf4151cc71c59b599dbc9000eb4665b4866222f8b5645eb0d0fb8981e301"

  def install
    bin.install "genflag-darwin-amd64"
    system "mv #{bin}/genflag-darwin-amd64 #{bin}/genflag"
  end

  test do
    shell_output("#{bin}/genflag -h", 1)
  end
end
