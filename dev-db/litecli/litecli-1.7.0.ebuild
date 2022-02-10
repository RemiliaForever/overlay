# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="CLI for SQLite Database with auto-completion and syntax highlighting"
HOMEPAGE="https://litecli.com"
LICENSE="BSD"
SRC_URI="https://github.com/dbcli/litecli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	>=dev-python/click-4.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-1.6[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-3.0.3[${PYTHON_USEDEP}]
	<dev-python/prompt_toolkit-4.0.0[${PYTHON_USEDEP}]
	dev-python/sqlparse[${PYTHON_USEDEP}]
	>=dev-python/configobj-5.0.5[${PYTHON_USEDEP}]
	>=dev-python/cli_helpers-1.0.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
