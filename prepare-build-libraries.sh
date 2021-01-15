ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=x86 -Dbuild.os.endianess=little -Dbuild.os.prefix=linux-x86
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=amd64 -Dbuild.os.endianess=little -Dbuild.os.prefix=linux-x86-64
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=arm -Dbuild.os.endianess=little -Dbuild.os.prefix=linux-arm -Dbuild.isArmSoftFloat=false
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=arm -Dbuild.os.endianess=little -Dbuild.os.prefix=linux-armel -Dbuild.isArmSoftFloat=true
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=aarch64 -Dbuild.os.endianess=little -Dbuild.os.prefix=linux-arm64
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=ppc -Dbuild.os.endianess=big
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=s390x -Dbuild.os.endianess=big
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=mips64el -Dbuild.os.endianess=little
ant native-build-package -Dbuild.os.name=Linux -Dbuild.os.family=unix -Dbuild.os.arch=ppc64le -Dbuild.os.endianess=little
ant native-build-package -Dbuild.os.name=SunOS -Dbuild.os.family=unix -Dbuild.os.arch=x86 -Dbuild.os.endianess=little
ant native-build-package -Dbuild.os.name=AIX -Dbuild.os.family=unix -Dbuild.os.arch=ppc64 -Dbuild.os.endianess=big
ant native-build-package -Dbuild.os.name=AIX -Dbuild.os.family=unix -Dbuild.os.arch=ppc -Dbuild.os.endianess=big
ant native-build-package -Dbuild.os.name=SunOS -Dbuild.os.family=unix -Dbuild.os.arch=sparc -Dbuild.os.endianess=big
ant native-build-package -Dbuild.os.name=FreeBSD -Dbuild.os.family=unix -Dbuild.os.arch=x86 -Dbuild.os.endianess=little -Dbuild.os.prefix=freebsd-x86
ant native-build-package -Dbuild.os.name=FreeBSD -Dbuild.os.family=unix -Dbuild.os.arch=amd64 -Dbuild.os.endianess=little -Dbuild.os.prefix=freebsd-x86-64
ant native-build-package -Dbuild.os.name=OpenBSD -Dbuild.os.family=unix -Dbuild.os.arch=x86 -Dbuild.os.endianess=little -Dbuild.os.prefix=freebsd-x86
ant native-build-package -Dbuild.os.name=OpenBSD -Dbuild.os.family=unix -Dbuild.os.arch=amd64 -Dbuild.os.endianess=little -Dbuild.os.prefix=freebsd-x86-64
