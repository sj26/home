# Allow hitching up
hitch() {
  command hitch "$@"
  [[ -s "$HOME/.hitch_export_authors" ]] && . "$HOME/.hitch_export_authors"
}
alias unhitch='hitch -u'
