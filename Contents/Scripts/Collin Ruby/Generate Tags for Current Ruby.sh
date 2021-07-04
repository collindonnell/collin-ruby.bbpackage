#!/bin/sh

shopt -s nullglob

PREFIX=$(rbenv prefix)
OUT_PATH=$(dirname "$BB_DOC_PATH")/ruby.tags

DIR="$PREFIX"/lib/ruby/[0-9]*

# Use ripper-tags if it's available
if type ripper-tags >/dev/null; then
  ripper-tags -R -f "$OUT_PATH" $DIR
elif type ctags >/dev/null; then
  ctags --languages=Ruby -R -f "$OUT_PATH" $DIR
else
  osascript -e 'tell application "BBEdit" to display alert "No ctags executable found in path." as critical' >/dev/null
fi
