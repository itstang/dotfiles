git_main_branch() {
  local b
  for b in main master trunk; do
    git show-ref -q --verify "refs/heads/$b" && { echo "$b"; return }
  done
  echo main
}
ggpush() { git push -u origin HEAD }
gcm()    { git checkout "$(git_main_branch)" }

mkcd() { mkdir -p "$1" && cd "$1" }

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

git-delete-squashed() {
  local main="$(git_main_branch)"
  git checkout -q "$main"
  git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do
    [[ $branch == "$main" ]] && continue
    mergeBase=$(git merge-base "$main" $branch)
    if [[ $(git cherry "$main" $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]]; then
      git branch -D $branch
    fi
  done
}
