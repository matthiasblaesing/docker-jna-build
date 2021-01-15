BASE_DIR="$(dirname "$0")"
source $BASE_DIR/common.sh

# Ensure debootstrap and qemu-debootstrap are present
apt-get update && apt-get install -qy debootstrap qemu-user-static unzip

# Bootstrap the build enviroments

cd /
mkdir build
cd build
for i in $DEBIAN_STRETCH_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i stretch debian-$i http://deb.debian.org/debian; done
for i in $DEBIAN_JESSIE_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i jessie debian-$i http://archive.debian.org/debian; done
export QEMU_CPU=arm1176
for i in $RASPBIAN_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i stretch raspbian-$i http://archive.raspbian.org/raspbian; done
unset QEMU_CPU
for i in $DEBIAN_SQUEEZE_BUILDS; do echo "Setup $i"; qemu-debootstrap --arch=$i squeeze debian-$i http://archive.debian.org/debian; done

# Installing the JDK needs proc file system mounted - so do this
for i in $DEBIAN_BUILDS; do mountProc /build/debian-$i/proc ;done
for i in $RASPBIAN_BUILDS; do mountProc /build/raspbian-$i/proc; done

# Run preparations
for i in $DEBIAN_BUILDS; do
    cp /prep/prepare-common.sh /build/debian-$i
    chroot /build/debian-$i /bin/bash prepare-common.sh
done

for i in $RASPBIAN_BUILDS; do
    export QEMU_CPU=arm1176
    cp /prep/prepare-common.sh /build/raspbian-$i
    chroot /build/raspbian-$i /bin/bash prepare-common.sh
    unset QEMU_CPU
done

for i in $DEBIAN_SQUEEZE_BUILDS; do
    cp /prep/prepare-squeeze.sh /build/debian-$i
    chroot /build/debian-$i /bin/bash prepare-squeeze.sh
done