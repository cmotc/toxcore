#! /bin/sh
DEBFOLDERNAME="toxcore_0.0.0+20150630.r3444"
cd toxcore
make clean
git pull kytvi2p master
git pull upstream master
git push origin master
rm "../$DEBFOLDERNAME.orig.tar.xz"
tar cf - ./ | xz -zf - > "../$DEBFOLDERNAME.orig.tar.xz"
cp -R ./ "../$DEBFOLDERNAME"
cd "../$DEBFOLDERNAME"
dpkg-source --commit
debuild >> ../log
