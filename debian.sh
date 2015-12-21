#! /bin/sh
DEBFOLDERNAME="toxcore_0.0.0+20150630.r3444"
cd toxcore
make clean
git pull kytvi2p master
git pull upstream master
git push origin master
<<<<<<< HEAD
rm "../$DEBFOLDERNAME.orig.tar.xz"
tar cf - ./ | xz -zf - > "../$DEBFOLDERNAME.orig.tar.xz"
cp -R ./ "../$DEBFOLDERNAME"
cd "../$DEBFOLDERNAME"
=======
rm "../$DEBFOLDERNAMEa.orig.tar.xz"
rm "../$DEBFOLDERNAMEb.orig.tar.xz"
tar cf - ./ | xz -zf - > "../$DEBFOLDERNAMEa.orig.tar.xz"
tar cf - ./ | xz -zf - > "../$DEBFOLDERNAMEb.orig.tar.xz"
cp -R ./ "../$DEBFOLDERNAMEa"
cd "../$DEBFOLDERNAMEa"
>>>>>>> 6c62d5f107c5de435d4bfadbd0764cfe57dc700c
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
