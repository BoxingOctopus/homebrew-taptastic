class HashiUp < Formula
  desc "Bootstrap HashiCorp Consul, Nomad, or Vault over SSH < 1 minute"
  homepage "https://github.com/jsiebens/hashi-up"
  url "https://github.com/jsiebens/hashi-up/releases/download/v0.16.0/hashi-up-arm64"
  sha256 "1c7b5c6f8aca9ebfc8d92bc9ac0b133af182298f61d71b58bcf78779ca96ccaf"

  def install
    bin.install "hashi-up-arm64"
    system "mv #{bin}/hashi-up-arm64 #{bin}/hashi-up"
  end

  test do
    shell_output("stat #{bin}/hashi-up", 1)
  end
end
