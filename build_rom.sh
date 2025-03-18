#!/bin/bash

export BUILD_USERNAME="queen"
export BUILD_HOSTNAME="foss-crave"

export TZ=Asia/Jakarta

rm -rf .repo/local_manifests/
repo init -u https://github.com/texascake/android.git -b lineage-17.1 --git-lfs
git clone --depth=1 https://github.com/texascake/local_manifest -b lineage-17.1 .repo/local_manifests

if [ -f /usr/bin/resync ]; then
   /usr/bin/resync
else
   /opt/crave/resync.sh
fi

. build/envsetup.sh
lunch lineage_X00T-user
mka bacon
