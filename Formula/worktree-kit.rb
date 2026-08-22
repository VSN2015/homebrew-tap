class WorktreeKit < Formula
  desc "Per-worktree runner: commands, servers, and DB/Redis isolation for git worktrees"
  homepage "https://github.com/VSN2015/worktree-kit"
  url "https://github.com/VSN2015/worktree-kit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4882688c36535e83aab4bf819f449ea128336dff53affcf60d1559bd7debe0da"
  license "MIT"

  depends_on "yq"

  def install
    # wt locates templates/ relative to its own real path, so keep the layout
    prefix.install "templates"
    bin.install "bin/wt"
  end

  test do
    system "git", "init", "-q"
    assert_match version.to_s, shell_output("#{bin}/wt --version")
  end
end
