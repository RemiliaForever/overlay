# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Curses based fullscreen BOINC manager"
HOMEPAGE="https://sourceforge.net/projects/boinctui/"
SRC_URI="https://sourceforge.net/projects/boinctui/files/${PN}_${PV}.tar.gz -> ${P}.tar.gz"
PATCHES="${FILESDIR}/tinfo.patch"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	sys-libs/ncurses
	dev-libs/openssl
	dev-libs/expat
"

src_configure() {
	eautoconf
	econf \
		--without-gnutls
}

src_compile() {
	emake
}

src_install() {
	dobin boinctui
}
