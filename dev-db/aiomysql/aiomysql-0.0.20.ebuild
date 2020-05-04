# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
inherit distutils-r1

DESCRIPTION="aiomysql is a library for accessing a MySQL database from the asyncio"
HOMEPAGE="https://github.com/aio-libs/aiomysql"
SRC_URI="https://github.com/aio-libs/aiomysql/archive/v${PV}.zip -> ${P}.zip"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-python/pymysql-0.9.3[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
