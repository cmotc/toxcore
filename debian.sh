#! /bin/sh
DEBFOLDERNAMEa="toxcore_0.0.0+20150630.r3444"
DEBFOLDERNAMEb="toxcore_0.0.0+20150323.r3271"
cd toxcore
make clean
git pull kytvi2p master
git pull upstream master
git push origin master
rm "../$DEBFOLDERNAMEa.orig.tar.xz"
rm "../$DEBFOLDERNAMEb.orig.tar.xz"
tar cf - ./ | xz -zf - > "../$DEBFOLDERNAMEa.orig.tar.xz"
tar cf - ./ | xz -zf - > "../$DEBFOLDERNAMEb.orig.tar.xz"
cp -R ./ "../$DEBFOLDERNAMEa"
cd "../$DEBFOLDERNAMEa"
dpkg-source --commit
debuild -us -uc >> ../log
cd ..

cp -R ./ "../$DEBFOLDERNAMEb"
cd "../$DEBFOLDERNAMEb"
dpkg-source --commit
debuild -us -uc >> ../log
cd ..

rm "../$DEBFOLDERNAMEa" -rf
rm "../$DEBFOLDERNAMEb" -rf
