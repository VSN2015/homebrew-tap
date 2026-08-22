class WorktreeKit < Formula
  desc "Per-worktree runner: commands, servers, and DB/Redis isolation for git worktrees"
  homepage "https://github.com/VSN2015/worktree-kit"
  url "https://github.com/VSN2015/worktree-kit/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "082a9e50d6871baa19da8400d3b3e1bb370d2ca62154dce4d2fb5eb5f78d4d85"
  license "MIT"

  # yq is a runtime need, not a build dependency: wt works with ANY yq v4 on
  # PATH (brew's, or a standalone binary) and checks for it itself, so a hard
  # depends_on would only force source builds on bottle-less systems.
  def install
    # wt locates templates/ relative to its own real path, so keep the layout
    prefix.install "templates"
    bin.install "bin/wt"
  end

  def caveats
    <<~EOS
      wt needs yq v4 on your PATH at runtime. Any yq works:
        brew install yq
      or put a standalone binary from https://github.com/mikefarah/yq on PATH.
      Check your setup with: wt doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt --version")
  end
end
