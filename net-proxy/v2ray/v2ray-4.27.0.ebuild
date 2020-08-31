# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit systemd

DESCRIPTION="A platform for building proxies to bypass network restrictions."
HOMEPAGE="https://www.v2ray.com/"
SRC_URI="https://github.com/v2ray/v2ray-core/archive/v${PV}.zip -> ${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="dev-lang/go"

RESTRICT="network-sandbox"

S="${WORKDIR}/v2ray-core-${PV}"

src_compile() {
	go build -o v2ray ./main || die
	go build -o v2ctl ./infra/control/main || die
}

src_install() {
	exeinto /usr/bin/v2ray
	doexe v2ray v2ctl

	insinto /usr/bin/v2ray
	doins release/config/geo{ip,site}.dat

	insinto /etc/v2ray
	doins release/config/*.json

	dodoc release/doc/readme.md

	systemd_dounit release/config/systemd/v2ray{,@}.service
}

