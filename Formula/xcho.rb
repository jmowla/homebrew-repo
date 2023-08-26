class Xcho < Formula
  include Language::Python::Virtualenv

  desc "Test Homebrew Formula"
  homepage "https://github.com/jmowla/xcho"
  url "https://github.com/jmowla/xcho/archive/refs/tags/0.1.0.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "python@3.11"

  uses_from_macos "libffi"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    res = resources.to_set(&:name)
    if OS.mac?
      res -= ["jeepney", "SecretStorage"]
    else
      res.reject! { |r| r.start_with? "pyobjc" }
    end
    res.each do |r|
      venv.pip_install resource(r)
    end
    venv.pip_install_and_link buildpath
  end

  test do
    system "true"
  end
end
