class Pins < Formula
  desc "Persistent tasks shared across AI coding tools"
  homepage "https://github.com/timmzhang/pins-releases"
  # Step 5 candidate only; this branch is not the public stable tap.
  url "https://github.com/timmzhang/pins-releases/releases/download/v0.1.0-candidate.917fdc7/pins-v0.1.0-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "629f466d73a12da3d25415001a60df58221014430e9d2ccaf8c3f407e7a5deb5"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :sequoia

  preserve_rpath

  def install
    libexec.install Dir["*"]
    # Supply a top-level metafile so Homebrew keeps the complete bundle intact.
    prefix.install_symlink libexec/"LICENSE"
    bin.install_symlink libexec/"pins"
  end

  def caveats
    <<~EOS
      This is a Pins 0.1.0 acceptance candidate, not the stable release.
      Check `type -a pins` before choosing your default command.
      User data stays in ~/.pins. Agent programs and login are separate.
      Skill and Agent configuration are never changed by this formula.
      Run `pins setup` to inspect integration before explicitly applying it.
    EOS
  end

  test do
    %w[README.md LICENSE CHANGELOG.md BUILD-INFO.json].each do |name|
      assert_path_exists libexec/name
    end
    assert_equal "Pins 0.1.0", shell_output("#{bin}/pins --version").strip
    ENV["PINS_DIR"] = testpath/"data"
    ENV["PINS_NO_LLM_TITLE"] = "1"
    system bin/"pins", "backlog", "formula acceptance"
    assert_match "formula acceptance", shell_output("#{bin}/pins list")
  end
end
