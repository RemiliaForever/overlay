# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python version of the Playwright testing and automation library."
HOMEPAGE="https://github.com/microsoft/playwright-python"
LICENSE="APACHE"
SRC_URI="https://github.com/microsoft/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
BDEPEND="
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

src_configure() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
}
