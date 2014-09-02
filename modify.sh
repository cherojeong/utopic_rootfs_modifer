#!/bin/sh

if [ -e modified-utopic-preinstalled-touch-armhf.tar.gz ]; then
	echo "Please remove modified-utopic-preinstalled-touch-armhf.tar.gz!"
	exit 1
fi

if [ -e tmp ]; then
	echo "Please remove the $(pwd)/tmp directory!"
	exit 1
fi


mkdir -p tmp
cd tmp

echo "To preserve file owner of extracting files, you need sudo permission"
echo "extracting files ... "

cp -f ../utopic-preinstalled-touch-armhf.tar.gz .

mkdir targz
cd targz

tar xfz ../utopic-preinstalled-touch-armhf.tar.gz --exclude='dev/*' --same-owner

rm ../utopic-preinstalled-touch-armhf.tar.gz

echo "Overwriting & Updating files ..."


rm -r \
	var/cache/apt/pkgcache.bin \
	var/cache/apt/srcpkgcache.bin \
	var/lib/apt/lists/* \
	var/log/lastlog \
	usr/share/icons/gnome \
	usr/share/icons/Humanity

cp -r ../../replacements/rootfs/* .

cd ..

echo "Compressing files ..."

cd targz
tar cfz ../utopic-preinstalled-touch-armhf.tar.gz *
cd ..

rm -fr ./targz
 
mv utopic-preinstalled-touch-armhf.tar.gz ../modified-utopic-preinstalled-touch-armhf.tar.gz

cd ../
rm -r tmp/

echo "Completed."

