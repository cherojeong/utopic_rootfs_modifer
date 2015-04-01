#!/bin/sh
# Author: Chero Jeong <cherojeong@gmail.com>
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
#  USA
#

set -e


usage() {
  echo "usage: $(basename $0) or $(basename $0) directoryname"
  echo "run with no argument, and then take the files in current directory"
  echo "run with diretoryname(ex $(basename $0) 20140928) and then take the file in 20140928 directory"
  echo "-h this message"

}

DATE=$1

DOWNLOAD_URL="http://cdimage.ubuntu.com/ubuntu-touch/daily-preinstalled"
DOWNLOAD_FILENAME=utopic-preinstalled-touch-armhf.tar.gz
DOWNLOAD_MANIFEST=utopic-preinstalled-touch-armhf.manifest

download_preinstalled_tgz()
{
	if [ -z "$DATE" ]; then
		wget $DOWNLOAD_URL/current/$DOWNLOAD_MANIFEST
		wget $DOWNLOAD_URL/current/$DOWNLOAD_FILENAME
	else
 		wget $DOWNLOAD_URL/$DATE/$DOWNLOAD_MANIFEST
 		wget $DOWNLOAD_URL/$DATE/$DOWNLOAD_FILENAME
	fi
}

echo 
echo "downloading $DL_FN from ubuntu cdimage site ... "
echo 

download_preinstalled_tgz

echo "[done]"


