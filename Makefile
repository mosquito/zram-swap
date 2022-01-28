VERSION = 0.1
BUILD_DIR = build/zram-swap-${VERSION}

all: build/zram-swap-${VERSION}.deb

build/zram-swap-${VERSION}.deb: \
		${BUILD_DIR}/sbin/zram-swap \
		${BUILD_DIR}/usr/lib/systemd/system/zram-swap.service \
		${BUILD_DIR}/etc/default/zram-swap

clean:
	rm -fr build

${BUILD_DIR}:
	mkdir -p ${BUILD_DIR}

${BUILD_DIR}/sbin/zram-swap: ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}/sbin
	install -m 0755 -o root -v zram-swap ${BUILD_DIR}/sbin/zram-swap

${BUILD_DIR}/usr/lib/systemd/system/zram-swap.service: ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}/usr/lib/systemd/system
	install -m 0644 -o root -v zram-swap.service ${BUILD_DIR}/usr/lib/systemd/system/zram-swap.service

${BUILD_DIR}/etc/default/zram-swap: ${BUILD_DIR}
	mkdir -p ${BUILD_DIR}/etc/default
	install -m 0644 -o root -v zram-swap.default ${BUILD_DIR}/etc/default/zram-swap
