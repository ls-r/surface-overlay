# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

CRATES="
addr2line-0.13.0
adler-0.2.3
ansi_term-0.11.0
atty-0.2.14
autocfg-1.0.1
backtrace-0.3.53
bitflags-1.2.1
cc-1.0.61
cfg-if-0.1.10
cfg-if-1.0.0
clap-2.33.3
failure-0.1.8
failure_derive-0.1.8
gimli-0.22.0
hermit-abi-0.1.17
indoc-1.0.3
libc-0.2.79
miniz_oxide-0.4.3
nix-0.19.0
object-0.21.1
proc-macro2-1.0.24
quote-1.0.7
rustc-demangle-0.1.17
strsim-0.8.0
syn-1.0.44
synstructure-0.12.4
textwrap-0.11.0
unicode-width-0.1.8
unicode-xid-0.2.1
unindent-0.1.7
vec_map-0.8.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

MY_P="${PN}-"$(ver_rs 3 '-')
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Command-line utility to control various functions of Microsoft Surface devices"
HOMEPAGE="https://github.com/linux-surface/surface-control"
SRC_URI="https://github.com/linux-surface/surface-control/archive/v0.3.0-1.tar.gz -> ${MY_P}.tar.gz"
SRC_URI+=" $(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
