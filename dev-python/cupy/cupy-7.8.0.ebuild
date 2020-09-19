# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="NumPy-like API accelerated with CUDA "
HOMEPAGE="https://github.com/cupy/cupy"
SRC_URI="https://github.com/cupy/cupy/archive/v${PV}.zip -> ${P}.zip"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-python/numpy-1.15[${PYTHON_USEDEP}]
	>=dev-python/fastrlock-0.3[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
