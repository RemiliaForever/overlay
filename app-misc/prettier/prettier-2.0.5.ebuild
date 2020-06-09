# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Prettier is an opinionated code formatter."
HOMEPAGE="https://prettier.io"
SRC_URI="https://github.com/prettier/prettier/archive/${PV}.zip -> ${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="net-libs/nodejs"

RESTRICT="network-sandbox"

src_compile() {
	# npm config set registry https://registry.npm.taobao.org
	npm install --no-fund || die
	npm run build || die
}

src_install() {
	insinto /usr/lib/${PN}
	doins -r dist/*

	fperms +x /usr/lib/${PN}/bin-${PN}.js
	dosym /usr/lib/${PN}/bin-${PN}.js ${EPREFIX}/usr/bin/${PN}
}
