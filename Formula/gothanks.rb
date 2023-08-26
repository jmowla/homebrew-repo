class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/jmowla/homebrew-repo/releases/download/gothanks-0.3.0"
    sha256 cellar: :any_skip_relocation, ventura:      "80409ef1fe5a4b7a481cc9fc5875a95ba375f787c11aa65fc9fa8a4c9d29bd67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4dfaeb46f30abdb29b6ee6a29ac56dd1c51cf0cc24fc84ecd9ef32107a62c0cb"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "true"
  end
end
