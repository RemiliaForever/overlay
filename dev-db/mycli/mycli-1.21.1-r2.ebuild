# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="CLI for MySQL Database with auto-completion and syntax highlighting"
HOMEPAGE="https://www.mycli.net"
LICENSE="BSD MIT"
SRC_URI="https://github.com/dbcli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
PATCHES="
	${FILESDIR}/prompt_toolkit.patch
	${FILESDIR}/fix-test-install.patch
"

SLOT="0"
KEYWORDS="amd64"
IUSE="ssh"

RDEPEND="
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.0[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-2.0.6[${PYTHON_USEDEP}]
	>=dev-python/pymysql-0.9.2[${PYTHON_USEDEP}]
	>=dev-python/sqlparse-0.3.0[${PYTHON_USEDEP}]
	<dev-python/sqlparse-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/configobj-5.0.6[${PYTHON_USEDEP}]
	>=dev-python/cryptography-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/cli_helpers-1.1.0[${PYTHON_USEDEP}]
	ssh? ( dev-python/paramiko[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}"

