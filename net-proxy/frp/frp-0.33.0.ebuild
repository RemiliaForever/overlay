# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module systemd

DESCRIPTION="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
HOMEPAGE="https://github.com/fatedier/frp"
SRC_URI="https://github.com/fatedier/frp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="client server"
REQUIRED_USE="|| (
	client
	server
)"
RESTRICT="network-sandbox"

RDEPEND=""
BDEPEND="dev-lang/go"
DEPEND="${RDEPEND}"

src_compile() {
	if use client; then
		go build -o bin/frpc ./cmd/frpc || die "client build failed!"
	fi

	if use server; then
		go build -o bin/frps ./cmd/frps || die "server build failed"
	fi
}

src_install() {
	use client && dobin bin/frpc
	use server && dobin bin/frps

	insinto /etc/frp/
	use client && doins conf/frpc{,_full}.ini
	use server && doins conf/frps{,_full}.ini

	elog $(ls conf/systemd)

	use client && systemd_dounit conf/systemd/frpc{,@}.service
	use server && systemd_dounit conf/systemd/frps{,@}.service
}
