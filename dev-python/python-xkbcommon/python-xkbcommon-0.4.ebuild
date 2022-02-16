# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python bindings for libxkbcommon using cffi"
HOMEPAGE="https://github.com/sde1000/python-xkbcommon"
LICENSE="MIT"
SRC_URI="https://github.com/sde1000/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-python/cffi-1.5.0[${PYTHON_USEDEP}]
	x11-libs/libxkbcommon
"
DEPEND="${RDEPEND}"
