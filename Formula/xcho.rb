class Xcho < Formula
  include Language::Python::Virtualenv

  desc "Test Homebrew Formula"
  homepage "https://github.com/jmowla/xcho"
  url "https://github.com/jmowla/xcho/archive/refs/tags/0.1.0.tar.gz"
  sha256 "34d066bcc7270d74e4fd021a13ec69d6fabef5c6c529c3dde3e9aa8f23d41458"

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
