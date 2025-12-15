#!/bin/bash

clear
echo "<-><File Type Identifier><->"
echo

FILE="$1"

if [[ -z "$FILE" || ! -f "$FILE" ]]; then
  echo "Usage: $0 <file>"
  exit 1
fi

echo "Analysis:"

echo "MD5"
md5sum "$FILE" | awk '{print $1}'

echo "SHA-1"
sha1sum "$FILE" | awk '{print $1}'

echo "SHA-256"
sha256sum "$FILE" | awk '{print $1}'

if command -v ssdeep >/dev/null 2>&1; then
  echo "SSDEEP"
  ssdeep -b "$FILE" | tail -n 1 | cut -d, -f1
fi

if command -v tlsh >/dev/null 2>&1; then
  echo "TLSH"
  tlsh "$FILE" | tail -n 1
fi

echo "Raw hex"
xxd -p -l 32 "$FILE" | tr -d '\n'
echo

FILE_OUT=$(file "$FILE")

TYPE=$(echo "$FILE_OUT" | cut -d: -f2 | cut -d, -f1 | xargs)

echo "File type"
echo "$TYPE"

echo "Magic"
echo "$FILE_OUT"

echo "File extension"
EXT="${FILE##*.}"
[[ "$EXT" == "$FILE" ]] && EXT="(none)"
echo "$EXT"

echo "File size"
SIZE_BYTES=$(stat -c%s "$FILE")
SIZE_HUMAN=$(du -h "$FILE" | cut -f1)
echo "$SIZE_HUMAN ($SIZE_BYTES bytes)"

echo
echo "Press Enter to continue..."
read
