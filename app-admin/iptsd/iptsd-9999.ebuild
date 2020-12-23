# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 systemd udev meson

DESCRIPTION="Intel Precise Touch & Stylus userspace daemon"
HOMEPAGE="https://github.com/linux-surface/iptsd"
EGIT_REPO_URI="https://github.com/linux-surface/iptsd.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="sample debug"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-libs/inih"

src_configure() {
	local emesonargs=(
		-Dsystemd=false
		$(meson_use sample sample_config)
		$(meson_use debug debug_tool)
	)
	meson_src_configure
}

src_install() {
	newinitd "${FILESDIR}/iptsd.initd" "iptsd"
	systemd_newunit "${FILESDIR}/iptsd.service" "iptsd.service"
	udev_newrules "${FILESDIR}/50-ipts.rules" "50-ipts.rules"

	meson_src_install
}
