class WorktreeKit < Formula
  desc "Per-worktree runner: commands, servers, and DB/Redis isolation for git worktrees"
  homepage "https://github.com/VSN2015/worktree-kit"
  url "https://github.com/VSN2015/worktree-kit/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "082a9e50d6871baa19da8400d3b3e1bb370d2ca62154dce4d2fb5eb5f78d4d85"
  license "MIT"

  depends_on "yq"

  def install
    # wt locates templates/ relative to its own real path, so keep the layout
    prefix.install "templates"
    bin.install "bin/wt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt --version")
  end
end
