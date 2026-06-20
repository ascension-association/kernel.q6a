#!/bin/bash

git clone -b wrynose https://github.com/openembedded/meta-openembedded.git
git clone -b wrynose https://github.com/qualcomm-linux/meta-qcom.git

kas build meta-radxa-bsp/ci/radxa-dragon-q6a.yml --target virtual/kernel

cp ./build/tmp/deploy/images/radxa-dragon-q6a/Image ../vmlinuz

rm -rf ./bitbake ./build ./oe-core
find . -maxdepth 1 -type d -name 'meta-*' ! -name meta-radxa-bsp -exec rm -rf {} +

echo "New vmlinuz kernel created successfully!"
