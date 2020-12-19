# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson # This eclass pre-selects meson and ninja as build dependencies
inherit git-r3 # A git eclass is required when fetching directly from sources

DESCRIPTION="Intel Precise Touch & Stylus userspace daemon"
HOMEPAGE="https://github.com/linux-surface/iptsd"
EGIT_REPO_URI="https://github.com/linux-surface/iptsd.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

# options specific to meson.eclass
MYMESONARGS=("-Dsystemd=false")

src_configure() {
	meson_src_configure
}
