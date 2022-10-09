# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python binding to the wlroots library using cffi "
HOMEPAGE="https://github.com/flacjacket/pywlroots"
LICENSE="UIUC"
SRC_URI="https://github.com/flacjacket/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-python/pywayland-0.4.14[${PYTHON_USEDEP}]
	>=dev-python/python-xkbcommon-0.2[${PYTHON_USEDEP}]
	>=gui-libs/wlroots-0.15.0
"
DEPEND="${RDEPEND}"
