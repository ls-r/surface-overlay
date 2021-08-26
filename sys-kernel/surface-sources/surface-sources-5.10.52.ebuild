# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="58"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Full sources for the kernel tree including genpatches and linux-surface patches"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches/ https://github.com/linux-surface/linux-surface"
KEYWORDS="~amd64"
IUSE="experimental"

SURFACE_VERSION="debian-5.13.12-1"
SURFACE_TARBALL="${SURFACE_VERSION}.tar.gz"
SURFACE_URI="https://github.com/linux-surface/linux-surface/archive/${SURFACE_TARBALL}"

SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${SURFACE_URI}"

src_unpack() {
	kernel-2_src_unpack

	pushd "${T}" > /dev/null
	unpack "${SURFACE_TARBALL}"
	popd > /dev/null

	eapply "${T}/linux-surface-${SURFACE_VERSION}/patches/${KV_MAJOR}.${KV_MINOR}"
}
