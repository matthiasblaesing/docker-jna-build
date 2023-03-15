BASE_DIR="$(dirname "$0")"
source $BASE_DIR/common.sh

/etc/init.d/binfmt-support stop
/etc/init.d/binfmt-support start

# Installing the JDK needs proc file system mounted - so do this
for i in $DEBIAN_BUILDS; do mountProc /build/debian-$i/proc ;done
for i in $RASPBIAN_BUILDS; do mountProc /build/raspbian-$i/proc; done