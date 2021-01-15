BASE_DIR="$(dirname "$0")"
source $BASE_DIR/common.sh

cd /prep/build-packages
for ARCH in $BIN_BUILDS; do
    ARCH_VAR=`echo $ARCH | sed -e 's/-/_/g'`
    BUILD_NAME=build-package-linux-$ARCH-$BIN_VERSION
    umount /build/$BUILD_ENV/build-package
    if [[ -d $BUILD_NAME ]]; then
        rm -r $BUILD_NAME
    fi
    unzip $BUILD_NAME.zip

    BUILD_ENV_VAR="BUILD_ENV_$ARCH_VAR"
    BUILD_ENV=${!BUILD_ENV_VAR}
    mkdir -p /build/$BUILD_ENV/build-package
    mount -o bind /prep/build-packages/$BUILD_NAME /build/$BUILD_ENV/build-package
    if [ "$ARCH" = "arm" ]; then
        export QEMU_CPU=arm1176;
    fi
    chroot /build/$BUILD_ENV /bin/bash -c 'cd build-package; export JAVA_HOME=/usr/lib/jvm/default-java; bash build.sh'
    unset QEMU_CPU
    umount /build/$BUILD_ENV/build-package
done