#! /bin/sh
#DEBFOLDERNAME="toxcore_0.0.0+20150630.r3444"
DEBFOLDERNAME="toxcore$(date +%Y%m%d)"
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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
