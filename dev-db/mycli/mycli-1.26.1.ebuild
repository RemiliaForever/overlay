# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="CLI for MySQL Database with auto-completion and syntax highlighting"
HOMEPAGE="https://www.mycli.net"
LICENSE="BSD MIT"
SRC_URI="https://github.com/dbcli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
PATCHES="
	${FILESDIR}/fix-test-install.patch
"

SLOT="0"
KEYWORDS="amd64"
IUSE="ssh"

RDEPEND="
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.6[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.6[${PYTHON_USEDEP}]
	<dev-python/prompt-toolkit-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pymysql-0.9.2[${PYTHON_USEDEP}]
	>=dev-python/sqlparse-0.3.0[${PYTHON_USEDEP}]
	<dev-python/sqlparse-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/sqlglot-5.1.3[${PYTHON_USEDEP}]
	>=dev-python/configobj-5.0.5[${PYTHON_USEDEP}]
	>=dev-python/cli_helpers-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/pyperclip-1.8.1[${PYTHON_USEDEP}]
	>=dev-python/pyaes-1.6.1[${PYTHON_USEDEP}]
	ssh? ( dev-python/paramiko[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}"

