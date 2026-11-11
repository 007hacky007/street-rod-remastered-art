#!/usr/bin/env bash
# Packs the art for a release: dist/Street-Rod-Remastered-art.zip (top folder Remaster: pack.json and
# pics/) and dist/Street-Rod-Remastered-art.txt, the manifest the launcher reads first (version, pack
# format, size and SHA-256 of the zip).
#
#   tools/make-release.sh VERSION
set -euo pipefail
version=${1:?usage: $0 VERSION}
cd "$(dirname "$0")/.."
format=$(sed -n 's/^ *"format": *\([0-9]*\).*/\1/p' pack.json | head -1)
[ -n "$format" ] || { echo "no format in pack.json" >&2; exit 1; }
rm -rf dist && mkdir -p dist/stage/Remaster
cp pack.json dist/stage/Remaster/
cp -R pics dist/stage/Remaster/
(cd dist/stage && find Remaster -type f | LC_ALL=C sort | zip -X -q -@ ../Street-Rod-Remastered-art.zip)
rm -rf dist/stage
zip=dist/Street-Rod-Remastered-art.zip
size=$(wc -c < "$zip" | tr -d ' ')
if command -v sha256sum >/dev/null; then sum=$(sha256sum "$zip" | cut -d' ' -f1); else sum=$(shasum -a 256 "$zip" | cut -d' ' -f1); fi
printf 'version=%s\nformat=%s\nsize=%s\nsha256=%s\n' "$version" "$format" "$size" "$sum" > dist/Street-Rod-Remastered-art.txt
cat dist/Street-Rod-Remastered-art.txt
