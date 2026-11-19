#!/usr/bin/env bash
# Usage: scripts/bump-version.sh 0.3.1
# Sets the same version in index.html and sw.js so installed apps see the update.
set -euo pipefail
v="${1:?usage: $0 <new-version>}"
cd "$(dirname "$0")/.."
sed -i -E "s/const APP_VERSION='[^']*'/const APP_VERSION='${v}'/" index.html
sed -i -E "s/const VERSION = '[^']*'/const VERSION = '${v}'/" sw.js
grep -q "APP_VERSION='${v}'" index.html && grep -q "VERSION = '${v}'" sw.js
echo "Version set to ${v}. Add a line to CHANGELOG.md, then commit and push."
