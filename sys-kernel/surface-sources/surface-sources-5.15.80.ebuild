# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="84"

inherit kernel-2
detect_version
detect_arch

DESCRIPTION="Full sources for the kernel tree including genpatches and linux-surface patches"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches/ https://github.com/linux-surface/linux-surface"
KEYWORDS="~amd64"
IUSE="experimental"

SURFACE_VERSION="debian-6.0.12-5"
SURFACE_TARBALL="${SURFACE_VERSION}.tar.gz"
SURFACE_URI="https://github.com/linux-surface/linux-surface/archive/${SURFACE_TARBALL}"

SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${SURFACE_URI}"

PATCH_PREFIX="${T}/linux-surface-${SURFACE_VERSION}/patches/${KV_MAJOR}.${KV_MINOR}"
PATCHES=(
	"${PATCH_PREFIX}/0001-surface3-oemb.patch"
	"${PATCH_PREFIX}/0003-ath10k.patch"
	"${PATCH_PREFIX}/0004-ipts.patch"
	"${PATCH_PREFIX}/0005-surface-sam.patch"
	"${PATCH_PREFIX}/0006-surface-sam-over-hid.patch"
	"${PATCH_PREFIX}/0007-surface-gpe.patch"
	"${PATCH_PREFIX}/0008-surface-button.patch"
	"${PATCH_PREFIX}/0009-surface-typecover.patch"
	"${PATCH_PREFIX}/0011-amd-gpio.patch"
)

src_unpack() {
	kernel-2_src_unpack

	pushd "${T}" > /dev/null
	unpack "${SURFACE_TARBALL}"
	popd > /dev/null
}

src_prepare() {
	eapply -- "${PATCHES[@]}"
	eapply_user
}
