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

DATE=$1

DOWNLOAD_URL="http://cdimage.ubuntu.com/ubuntu-touch/daily-preinstalled"
DOWNLOAD_FILENAME=utopic-preinstalled-touch-armhf.tar.gz


download_preinstalled_tgz()
{
	if [ -z "$DATE" ]; then
		wget $DOWNLOAD_URL/current/$DOWNLOAD_FILENAME
	else
 		wget $DOWNLOAD_URL/$DATE/$DOADLOAD_FILENAME
	fi
}

echo 
echo "downloading $DL_FN from ubuntu cdimage site ... "
echo 

download_preinstalled_tgz

echo "[done]"


