VERSION = 0.1
BUILD_DIR = build/zram-swap-${VERSION}

all: build/zram-swap-${VERSION}.deb

build/zram-swap-${VERSION}.deb: \
		${BUILD_DIR}/DEBIAN/control \
		${BUILD_DIR}/sbin/zram-swap \
		${BUILD_DIR}/usr/lib/systemd/system/zram-swap.service \
		${BUILD_DIR}/etc/default/zram-swap
	dpkg-deb --build ${BUILD_DIR}

${BUILD_DIR}/DEBIAN/control: ${BUILD_DIR}
	mkdir -p DEBIAN ${BUILD_DIR}/DEBIAN
	VERSION=${VERSION} python3 gen-control.py > ${BUILD_DIR}/DEBIAN/control

clean:
	rm -fr build

${BUILD_DIR}:
	mkdir -p ${BUILD_DIR}

${BUILD_DIR}/sbin/zram-swap: ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}/sbin
	install zram-swap ${BUILD_DIR}/sbin/zram-swap

${BUILD_DIR}/usr/lib/systemd/system/zram-swap.service: ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}/usr/lib/systemd/system
	install zram-swap.service ${BUILD_DIR}/usr/lib/systemd/system/zram-swap.service

${BUILD_DIR}/etc/default/zram-swap: ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}/etc/default
	install zram-swap.default ${BUILD_DIR}/etc/default/zram-swap
