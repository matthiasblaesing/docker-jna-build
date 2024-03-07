BASE_DIR="$(dirname "$0")"
source $BASE_DIR/common.sh

/etc/init.d/binfmt-support stop
/etc/init.d/binfmt-support start
/usr/lib/systemd/systemd-binfmt
echo -n ":qemu-loongarch64-2:M:0:\\x7f\\x45\\x4c\\x46\\x02\\x01\\x01\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x03\\x00\\x02\\x01:\\xff\\xff\\xff\\xff\\xff\\xff\\xff\\xfc\\x00\\xff\\xff\\xff\\xff\\xff\\xff\\xff\\xfe\\xff\\xff\\xff:/usr/libexec/qemu-binfmt/loongarch64-binfmt-P:POCF" > /proc/sys/fs/binfmt_misc/register

# Installing the JDK needs proc file system mounted - so do this
for i in $DEBIAN_BUILDS; do mountProc /build/debian-$i/proc ;done
for i in $RASPBIAN_BUILDS; do mountProc /build/raspbian-$i/proc; done
for i in $UBUNTU_BUILDS; do mountProc /build/ubuntu-$i/proc ;done