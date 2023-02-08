class HashiUp < Formula
  desc "Bootstrap HashiCorp Consul, Nomad, or Vault over SSH < 1 minute "
  homepage "https://github.com/jsiebens/hashi-up/blob/main/README.md"
  url "https://github.com/jsiebens/hashi-up.git",
      tag:      "v0.16.0",
      revision: "b062f5d9d4040b591f733a9e58e8977faad1ae88"
  license "MIT"
  head "https://github.com/jsiebens/hashi-up.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "1c7b5c6f8aca9ebfc8d92bc9ac0b133af182298f61d71b58bcf78779ca96ccaf"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "1c7b5c6f8aca9ebfc8d92bc9ac0b133af182298f61d71b58bcf78779ca96ccaf"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "1c7b5c6f8aca9ebfc8d92bc9ac0b133af182298f61d71b58bcf78779ca96ccaf"
    sha256 cellar: :any_skip_relocation, ventura:        "4487c361493362c8f19fecb80097695ab6e1303c74f290aba8f66c55d1eeb726"
    sha256 cellar: :any_skip_relocation, monterey:       "4487c361493362c8f19fecb80097695ab6e1303c74f290aba8f66c55d1eeb726"
    sha256 cellar: :any_skip_relocation, big_sur:        "4487c361493362c8f19fecb80097695ab6e1303c74f290aba8f66c55d1eeb726"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1ca871fcd040f4498fd8aca2a40a5092fb3f64210c6285497546852b305c25be"
  end

  depends_on "go" => :build

  def install
    project = "github.com/jsiebens/hashi-up"
    ldflags = %W[
      -s -w
      -X #{project}/config.appVersion=#{version}
      -X #{project}/config.revision=#{Utils.git_head}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/hashi-up"

    generate_completions_from_executable(bin/"hashi-up", "completion")
  end

  test do
    shell_output("stat #{bin}/hashi-up", 1)
  end
end
