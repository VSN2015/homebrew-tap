class WorktreeKit < Formula
  desc "Per-worktree runner: commands, servers, and DB/Redis isolation for git worktrees"
  homepage "https://github.com/VSN2015/worktree-kit"
  url "https://github.com/VSN2015/worktree-kit/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "bf7061b9246ec20f24e57c3fe9deffc4c6640e369e65410f21c3f149ecc4f094"
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
