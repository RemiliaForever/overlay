# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="A linter for prose."
HOMEPAGE="http://proselint.com"
SRC_URI="https://github.com/amperser/proselint/archive/${PV}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

src_prepare() {
	default

	sed -i 's/^exclude.*$//' pyproject.toml
}
