class WorktreeKit < Formula
  desc "Per-worktree runner: commands, servers, and DB/Redis isolation for git worktrees"
  homepage "https://github.com/VSN2015/worktree-kit"
  url "https://github.com/VSN2015/worktree-kit/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "5cda7851ea0e5bb342f3de841de34c4a6b2e7a12f61a2dd33d840c65f60b008c"
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
