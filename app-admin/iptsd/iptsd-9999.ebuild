# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 # A git eclass is required when fetching directly from sources
inherit meson # This eclass pre-selects meson and ninja as build dependencies

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
		$(meson_use sample sample_config)
		$(meson_use debug debug_tool)
	)
	meson_src_configure -Dsystemd=false
	# TODO: enable support for systemd
}
