#!/bin/bash

#./build.sh
cd ../android
source build/envsetup.sh
lunch << EOF
8
EOF

extract-bsp
make -j8
pack

echo "Done!"
