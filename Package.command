#!/bin/sh
# By chris1111
# Copyright © 2025 chris1111. All Right Reserved.
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"
rm -rf ./FileUse
rm -rf ./VoodooHDA-Tahoe.pkg
# Create the Packages with pkgbuild/productbuild
echo "Create the Packages with pkgbuild/productbuild"
sleep 1
pkgbuild --root ./Package/VoodooHDATahoe --scripts ./Package/scripts --identifier com.VoodooHDATahoe --version 1 --install-location /Private/tmp/ ./VoodooHDATahoe.pkg
productbuild --distribution  ./Package/Distribution.xml --resources ./Package/Resources --package-path ./VoodooHDATahoe.pkg ./VoodooHDA-Tahoe.pkg
rm -rf ./VoodooHDATahoe.pkg
echo "Done"
# Expend the Packages with pkgutil
pkgutil --expand ./VoodooHDA-Tahoe.pkg ./FileUse
Sleep 1
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
echo "Expend the Packages with pkgutil Completed!   "
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
Sleep 2
# Copy resources and distribution
rm -rf ./FileUse/Distribution
Rm -rf ./FileUse/Resources
Sleep 1
cp -rp ./package/FILES/Distribution ./FileUse
cp -rp ./package/FILES/Resources ./FileUse
Sleep 1
# Flatten the Packages with pkgutil
pkgutil --flatten ./FileUse ./VoodooHDA-Tahoe.pkg
Sleep 1
rm -rf ./FileUse
# Change package Icon with seticon
./package/FILES/seticon -d ./package/Pics/AppIcon.icns ./VoodooHDA-Tahoe.pkg
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "
echo "VoodooHDA-Tahoe.pkg
Completed Done!   "
echo "= = = = = = = = = = = = = = = = = = = = = = = = =  "