BASE_DIR="$(dirname "$0")"
source $BASE_DIR/common.sh

# Ensure debootstrap and qemu-debootstrap are present
apt-get update && apt-get install -qy debootstrap qemu-user-static unzip

# Restart binfmt support
/etc/init.d/binfmt-support stop
/etc/init.d/binfmt-support start

# Bootstrap the build enviroments

cd /
mkdir build
cd build
for i in $DEBIAN_BUSTER_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i buster debian-$i http://deb.debian.org/debian; done
for i in $DEBIAN_STRETCH_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i stretch debian-$i http://deb.debian.org/debian; done
for i in $DEBIAN_JESSIE_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i jessie debian-$i http://archive.debian.org/debian; done
for i in $DEBIAN_PORTS_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i unstable debian-$i http://deb.debian.org/debian-ports; done
export QEMU_CPU=arm1176
for i in $RASPBIAN_BUILDS;do echo "Setup $i"; qemu-debootstrap --arch=$i stretch raspbian-$i http://archive.raspbian.org/raspbian; done
unset QEMU_CPU
for i in $DEBIAN_SQUEEZE_BUILDS; do echo "Setup $i"; qemu-debootstrap --arch=$i squeeze debian-$i http://archive.debian.org/debian; done

# Installing the JDK needs proc file system mounted - so do this
for i in $DEBIAN_BUILDS; do mountProc /build/debian-$i/proc ;done
for i in $RASPBIAN_BUILDS; do mountProc /build/raspbian-$i/proc; done

# Run preparations
for i in $DEBIAN_BUSTER_BUILDS; do
    echo -e "deb http://deb.debian.org/debian buster main\ndeb-src http://deb.debian.org/debian buster main" > /build/debian-$i/etc/apt/sources.list
    cp /prep/prepare-common.sh /build/debian-$i
    chroot /build/debian-$i /bin/bash prepare-common.sh
done

for i in $DEBIAN_STRETCH_BUILDS; do
    echo -e "deb http://deb.debian.org/debian stretch main\ndeb-src http://deb.debian.org/debian stretch main" > /build/debian-$i/etc/apt/sources.list
    cp /prep/prepare-common.sh /build/debian-$i
    chroot /build/debian-$i /bin/bash prepare-common.sh
done

for i in $DEBIAN_JESSIE_BUILDS; do
    echo -e "deb http://archive.debian.org/debian jessie main\ndeb-src http://archive.debian.org/debian jessie main" > /build/debian-$i/etc/apt/sources.list
    cp /prep/prepare-common.sh /build/debian-$i
    chroot /build/debian-$i /bin/bash prepare-common.sh
done

for i in $DEBIAN_PORTS_BUILDS; do
    echo -e "deb [trusted=yes] http://deb.debian.org/debian-ports sid main\ndeb-src http://deb.debian.org/debian unstable main" > /build/debian-$i/etc/apt/sources.list
    cp /prep/prepare-common.sh /build/debian-$i
    chroot /build/debian-$i /bin/bash prepare-common.sh
done

for i in $RASPBIAN_BUILDS; do
    export QEMU_CPU=arm1176
    echo -e "deb http://archive.raspbian.org/raspbian stretch main\ndeb-src http://archive.raspbian.org/raspbian stretch main" > /build/raspbian-$i/etc/apt/sources.list
    cp /prep/prepare-common.sh /build/raspbian-$i
    chroot /build/raspbian-$i /bin/bash prepare-common.sh
    unset QEMU_CPU
done

for i in $DEBIAN_SQUEEZE_BUILDS; do
    echo -e "deb http://archive.debian.org/debian squeeze main\ndeb-src http://archive.debian.org/debian squeeze main" > /build/debian-$i/etc/apt/sources.list
    cp /prep/prepare-squeeze.sh /build/debian-$i
    cp /prep/prepare-common.sh /build/debian-$i
    chroot /build/debian-$i /bin/bash prepare-common.sh
    chroot /build/debian-$i /bin/bash prepare-squeeze.sh
done