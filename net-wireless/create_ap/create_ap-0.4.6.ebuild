# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit systemd bash-completion-r1

DESCRIPTION="This script creates a NATed or Bridged WiFi Access Point. "
HOMEPAGE="https://github.com/oblique/create_ap"
SRC_URI="https://github.com/oblique/create_ap/archive/v${PV}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="haveged doc"

RDEPEND="app-shells/bash
	sys-apps/util-linux
	sys-process/procps
	net-wireless/hostapd
	sys-apps/iproute2
	net-wireless/iw
	net-firewall/iptables
	net-dns/dnsmasq
	haveged? ( sys-apps/haveged )
"
DEPEND="${RDEPEND}"

src_install() {
	dobin create_ap

	insinto /etc
	doins create_ap.conf

	use doc && dodoc README.md

	systemd_dounit create_ap.service
	newbashcomp bash_completion create_ap
}
