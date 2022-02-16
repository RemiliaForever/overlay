# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python bindings for the libwayland library"
HOMEPAGE="https://github.com/flacjacket/pywayland"
LICENSE="Apache"
SRC_URI="https://github.com/flacjacket/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-python/cffi-1.12.0[${PYTHON_USEDEP}]
	dev-libs/wayland
"
DEPEND="${RDEPEND}"

src_configure() {
	python3 ./pywayland/ffi_build.py || die
	python3 -m pywayland.scanner || die

	default
}
