# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg

DESCRIPTION="WPS Office is an office productivity suite, Here is the Chinese version"
HOMEPAGE="https://www.wps.cn/product/wpslinux/"

KEYWORDS="amd64 ~arm64 ~loong ~mips"

SRC_URI="
        amd64?  ( https://wb9.s-ton.top/wps302/${PV}/amd64 -> ${PN}_${PV}_amd64.deb )
        arm64?  ( https://wb9.s-ton.top/wps302/${PV}/arm64 -> ${PN}_${PV}_arm64.deb )
        loong?  ( https://wb9.s-ton.top/wps302/${PV}/loongarch64 -> ${PN}_${PV}_loongarch64.deb )
        mips?   ( https://wb9.s-ton.top/wps302/${PV}/mips64el -> ${PN}_${PV}_mips64el.deb )
"

SLOT="0"
RESTRICT="strip mirror bindist" # mirror as explained at bug #547372
LICENSE="WPS-EULA"
IUSE="big-endian systemd"
REQUIRED_USE="mips? ( !big-endian )"

# Deps got from this (listed in order):
# rpm -qpR wps-office-10.1.0.5707-1.a21.x86_64.rpm
# ldd /opt/kingsoft/wps-office/office6/wps
# ldd /opt/kingsoft/wps-office/office6/wpp
RDEPEND="
	app-arch/bzip2:0
	media-libs/freetype:2
	net-print/cups
	dev-libs/glib:2
	virtual/glu
	x11-libs/libSM
	x11-libs/libXrender
	media-libs/fontconfig:1.0
	x11-libs/libXext
	x11-libs/libxcb
"

S="${WORKDIR}"

pkg_nofetch() {
        einfo "Please download WPS Office 2019 For Linux version ${PV} from"
        einfo "    ${HOMEPAGE}"
        einfo "The archive should then be placed into your distfiles directory."
}

src_install() {
        exeinto /usr/bin
        exeopts -m0755
        doexe "${S}"/usr/bin/*

        insinto /usr/share
        doins -r "${S}"/usr/share/{applications,desktop-directories,icons,mime,templates}

        insinto /opt/kingsoft/wps-office
        use systemd || { rm "${S}"/opt/kingsoft/wps-office/office6/libdbus-1.so* || die ; }
        rm "${S}"/opt/kingsoft/wps-office/office6/libstdc++.so* || die
        doins -r "${S}"/opt/kingsoft/wps-office/{office6,templates}

        fperms 0755 /opt/kingsoft/wps-office/office6/{wps,wpp,et,wpspdf,wpsoffice,promecefpluginhost,transerr,ksolaunch,wpscloudsvr}
}
