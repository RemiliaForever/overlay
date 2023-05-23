# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Python SQL Parser and Transpiler "
HOMEPAGE="https://github.com/tobymao/sqlglot"
SRC_URI="https://github.com/tobymao/sqlglot/archive/v${PV}.zip -> ${P}.zip"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
