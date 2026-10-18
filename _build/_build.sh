#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

for repo in openembedded/meta-openembedded qualcomm-linux/meta-qcom; do
  dir=${repo#*/}
  [ -d "$dir" ] || git clone --depth=1 -b wrynose "https://github.com/$repo.git"
done

if kas build meta-radxa-bsp/ci/radxa-dragon-q6a.yml --target virtual/kernel; then
  cp ./build/tmp/deploy/images/radxa-dragon-q6a/Image ../vmlinuz
  rm -rf ./bitbake ./build ./oe-core
  find . -maxdepth 1 -type d -name 'meta-*' ! -name meta-radxa-bsp -exec rm -rf {} +
  echo "New vmlinuz kernel created successfully!"
else
  echo "Build error - see logs in _build/build/tmp/log for more details." >&2
  exit 1
fi
