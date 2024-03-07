function mountProc {
    mkdir -p $1
    mountpoint $1
    if [ "$?" != "0" ]; then
        mount -o bind /proc $1
    fi
}

# - based on debian stretch:
#   - mips64el
# - based on debian stretch:
#   - arm64
#   - mips (not used yet)
#   - s390x
#   - ppc64el
# - base on debian jessie:
#   - armel
#   - armhf (excluded, covered by raspbian)
#   - powerpc
# - based on raspbian:
#   - armhf / arm6l
# - based on squeeze:
#   - amd64
#   - i386
# - based on debian ports:
#   - riscv64

DEBIAN_BUSTER_BUILDS="mips64el"
DEBIAN_STRETCH_BUILDS="arm64 mips s390x ppc64el"
DEBIAN_JESSIE_BUILDS="armel powerpc"
RASPBIAN_BUILDS="armhf"
DEBIAN_SQUEEZE_BUILDS="amd64 i386"
UBUNTU_PORTS_BUILDS="riscv64"
DEBIAN_BUILDS="$DEBIAN_BUSTER_BUILDS $DEBIAN_STRETCH_BUILDS $DEBIAN_JESSIE_BUILDS $DEBIAN_SQUEEZE_BUILDS"
UBUNTU_BUILDS="$UBUNTU_PORTS_BUILDS"

BIN_VERSION=7.0.1
BIN_BUILDS="aarch64 arm armel mips64el ppc64le ppc s390x x86 x86-64 riscv64"
# minus signes are converted to underscores
BUILD_ENV_aarch64="debian-arm64"
BUILD_ENV_arm="raspbian-armhf"
BUILD_ENV_armel="debian-armel"
BUILD_ENV_mips64el="debian-mips64el"
BUILD_ENV_ppc64le="debian-ppc64el"
BUILD_ENV_ppc="debian-powerpc"
BUILD_ENV_s390x="debian-s390x"
BUILD_ENV_x86="debian-i386"
BUILD_ENV_x86_64="debian-amd64"
BUILD_ENV_riscv64="ubuntu-riscv64"
