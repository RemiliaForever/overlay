# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A VA-API implemention using NVIDIA's NVDEC"
HOMEPAGE="https://github.com/elFarto/nvidia-vaapi-driver"
#SRC_URI="https://github.com/elFarto/nvidia-vaapi-driver/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/elFarto/nvidia-vaapi-driver/archive/refs/heads/master.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

BDEPEND=">=media-libs/nv-codec-headers-11.1.5.1"
DEPEND="media-libs/gst-plugins-bad
	media-libs/libglvnd"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-01-install-path.patch"
	#"${FILESDIR}/${PN}-02-set-unique-name.patch"
)

#S="${WORKDIR}/nvidia-vaapi-driver-${PV}"
S="${WORKDIR}/nvidia-vaapi-driver-master"
