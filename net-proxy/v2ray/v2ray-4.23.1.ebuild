# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit systemd go-module

EGO_SUM=(
	"cloud.google.com/go v0.26.0/go.mod"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.2"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/google/go-cmp v0.2.0"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/gorilla/websocket v1.4.1"
	"github.com/gorilla/websocket v1.4.1/go.mod"
	"github.com/miekg/dns v1.1.4"
	"github.com/miekg/dns v1.1.4/go.mod"
	"github.com/refraction-networking/utls v0.0.0-20190909200633-43c36d3c1f57"
	"github.com/refraction-networking/utls v0.0.0-20190909200633-43c36d3c1f57/go.mod"
	"go.starlark.net v0.0.0-20190919145610-979af19b165c"
	"go.starlark.net v0.0.0-20190919145610-979af19b165c/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20180831171423-11092d34479b"
	"google.golang.org/genproto v0.0.0-20180831171423-11092d34479b/go.mod"
	"google.golang.org/grpc v1.24.0"
	"google.golang.org/grpc v1.24.0/go.mod"
	"h12.io/socks v1.0.0"
	"h12.io/socks v1.0.0/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
)
go-module_set_globals

DESCRIPTION="A platform for building proxies to bypass network restrictions."
HOMEPAGE="https://www.v2ray.com/"
SRC_URI="https://github.com/v2ray/v2ray-core/archive/v${PV}.zip -> ${P}.zip
	${EGO_SUM_SRC_URI}"


LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="dev-lang/go"

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

