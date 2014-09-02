#!/bin/sh

ROOTSTOCK_PATH=~/work/bzr-project/project-rootstock-ng
SYSTEMIMG_PATH=~/work/sources/phablet-4.4.2/out/target/product/vega

$ROOTSTOCK_PATH/rootstock-touch-install ./modified-utopic-preinstalled-touch-armhf.tar.gz $SYSTEMIMG_PATH/system.img

