#! /bin/sh
if [ -n "$BASH_VERSION" ]; then
	TOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
	TOME=$( cd "$( dirname "$0" )" && pwd )
fi
#DEBFOLDERNAME="toxcore_0.0.0+20150630.r3444"
DEBFOLDERNAME="toxcore$(date +%Y%m%d)"
DEBFOLDERNAME="$TOME/../$DEBFOLDER-$DEBVERSION"
cd $TOME
make clean
git pull kytvi2p master
git pull upstream master
git push origin master
rm "../$DEBFOLDERNAME.orig.tar.xz"
tar cf - ./ | xz -zf - > "../$DEBFOLDERNAME.orig.tar.xz"
cp -R ./ "../$DEBFOLDERNAME"
cd "../$DEBFOLDERNAME"
dpkg-source --commit
debuild -us -uc >> ../log
cd ..
rm "../$DEBFOLDERNAME" -rf
