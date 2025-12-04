clean_clipboard() {
  pbpaste | python3 -c 'import sys; print(sys.stdin.read().replace("\u2028", "\n"))' | pbcopy
  echo "Clipboard cleaned!"
}
