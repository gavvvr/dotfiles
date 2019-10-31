compdef g=git
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}
