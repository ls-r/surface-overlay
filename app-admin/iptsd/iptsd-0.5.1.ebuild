# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd udev meson

DESCRIPTION="Intel Precise Touch & Stylus userspace daemon"
HOMEPAGE="https://github.com/linux-surface/iptsd"
SRC_URI="https://github.com/linux-surface/iptsd/archive/v0.5.1.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="sample debug"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-libs/inih"

EMESON_SOURCE="${S}"
BUILD_DIR="${WORKDIR}/${P}-build"

src_configure() {
	local emesonargs=(
		"-Dservice_manager="
		$(meson_use sample sample_config)
		$(meson_use debug debug_tool)
	)

	meson_src_configure
}

src_install() {
	newinitd "${BUILD_DIR}/iptsd.initd" "iptsd"
	systemd_newunit "${BUILD_DIR}/iptsd.service" "iptsd.service"
	udev_newrules "${EMESON_SOURCE}/etc/udev/50-ipts.rules" "50-ipts.rules"

	meson_src_install
}
