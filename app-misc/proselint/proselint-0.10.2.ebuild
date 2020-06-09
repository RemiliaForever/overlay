# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit distutils-r1

DESCRIPTION="A linter for prose."
HOMEPAGE="http://proselint.com"
SRC_URI="https://github.com/amperser/proselint/archive/${PV}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-python/click
	dev-python/future
	dev-python/six
"
DEPEND="${RDEPEND}"
