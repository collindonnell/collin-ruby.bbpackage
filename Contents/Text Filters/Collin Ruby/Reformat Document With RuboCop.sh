#!/usr/bin/env zsh

if [[ $BB_DOC_MODE == "ruby" ]]; then
  result=$(rubocop -A --stderr --stdin "/dev/null" 2>/dev/null < "${1:-/dev/stdin}")
  echo $result
else
  exit 1
fi
