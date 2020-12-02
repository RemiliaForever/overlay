# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
VALA_USE_DEPEND="vapigen"
VALA_MIN_API_VERSION="0.32"

inherit git-r3 meson vala xdg

DESCRIPTION="Library providing a virtual terminal emulator widget"
HOMEPAGE="https://wiki.gnome.org/Apps/Terminal/VTE termite-patch? ( https://github.com/thestinger/vte-ng"

LICENSE="LGPL-2.1"
SLOT="2.91"
EGIT_REPO_URI="https://github.com/thestinger/vte-ng"
EGIT_COMMIT=0.58.2.a

IUSE="+crypt debug gtk-doc +icu +introspection systemd +vala +termite-patch"
KEYWORDS="amd64"
REQUIRED_USE="vala? ( introspection )"

RDEPEND="
	>=x11-libs/gtk+-3.24.14:3[introspection?]
	>=dev-libs/fribidi-1.0.0
	>=dev-libs/glib-2.52:2
	crypt?  ( >=net-libs/gnutls-3.2.7:0= )
	icu? ( dev-libs/icu:= )
	>=x11-libs/pango-1.22.0
	>=dev-libs/libpcre2-10.21
	systemd? ( >=sys-apps/systemd-220:= )
	sys-libs/zlib
	introspection? ( >=dev-libs/gobject-introspection-1.56:= )
	x11-libs/pango[introspection?]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/libxml2:2
	dev-util/glib-utils
	gtk-doc? ( >=dev-util/gtk-doc-1.13
		app-text/docbook-xml-dtd:4.1.2 )
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig

	vala? ( $(vala_depend) )
"

src_prepare() {
	default

	# if ! use vanilla; then
	# 	# Part of https://src.fedoraproject.org/rpms/vte291/raw/f31/f/vte291-cntnr-precmd-preexec-scroll.patch
	# 	# Adds OSC 777 support for desktop notifications in gnome-terminal or elsewhere
	# 	eapply "${WORKDIR}"/${P}-command-notify.patch
	# fi

	# -Ddebugg option enables various debug support via VTE_DEBUG, but also ggdb3; strip the latter
	sed -e '/ggdb3/d' -i meson.build || die

	use vala && vala_src_prepare
	xdg_src_prepare
}

src_configure() {
	local emesonargs=(
		-Da11y=true
		$(meson_use debug debugg)
		$(meson_use gtk-doc docs)
		$(meson_use introspection gir)
		-Dfribidi=true # pulled in by pango anyhow
		$(meson_use crypt gnutls)
		-Dgtk3=true
		-Dgtk4=false
		$(meson_use icu)
		$(meson_use systemd _systemd)
		$(meson_use vala vapi)
	)
	meson_src_configure
}

src_install() {
	meson_src_install
	mv "${ED}"/etc/profile.d/vte{,-${SLOT}}.sh || die
}