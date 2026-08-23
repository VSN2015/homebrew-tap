class WorktreeKit < Formula
  desc "Per-worktree runner: commands, servers, and DB/Redis isolation for git worktrees"
  homepage "https://github.com/VSN2015/worktree-kit"
  url "https://github.com/VSN2015/worktree-kit/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "9ed20f75b7cf4125c262fb8b71550f7ae6c6f1afba62d548f971c5e29c23149c"
  license "MIT"

  # no dependencies: wt reads YAML with whichever of yq, ruby, or
  # python3 + PyYAML is already on PATH (macOS ships ruby).
  def install
    # wt locates templates/ relative to its own real path, so keep the layout
    prefix.install "templates"
    bin.install "bin/wt"
  end

  def caveats
    <<~EOS
      wt reads its YAML config with whichever of yq, ruby, or
      python3 + PyYAML is already on your PATH — macOS ships ruby,
      so nothing extra is needed. Check with: wt doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt --version")
  end
end
