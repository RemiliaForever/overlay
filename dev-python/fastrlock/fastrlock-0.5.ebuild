# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="A fast RLock implementation for CPython"
HOMEPAGE="https://github.com/scoder/fastrlock"
SRC_URI="https://github.com/scoder/fastrlock/archive/${PV}.zip -> ${P}.zip"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
