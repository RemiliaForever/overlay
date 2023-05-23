# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A high-performance neural network inference framework"
HOMEPAGE="https://github.com/Tencent/ncnn"

SRC_URI="https://github.com/Tencent/ncnn/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="
	dev-util/glslang
	dev-util/vulkan-headers
	media-libs/vulkan-loader"

RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=test # Tests tries to use real GPU.

PATCHES=( "${FILESDIR}"/ncnn-fix-glslang-include.patch )

src_configure() {
	local mycmakeargs=(
		-DCMAKE_TOOLCHAIN_FILE="${S}/toolchains/host.gcc.toolchain.cmake"
		-DNCNN_BUILD_EXAMPLES=OFF
		-DNCNN_BUILD_TOOLS=ON
		-DNCNN_VULKAN=ON
		-DNCNN_SYSTEM_GLSLANG=ON
		-DGLSLANG_TARGET_DIR="${EPREFIX}/usr/$(get_libdir)/cmake"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	exeinto /usr/bin
	doexe ${BUILD_DIR}/tools/ncnn2mem
	doexe ${BUILD_DIR}/tools/ncnnmerge
	doexe ${BUILD_DIR}/tools/ncnnoptimize
	doexe ${BUILD_DIR}/tools/caffe/caffe2ncnn
	doexe ${BUILD_DIR}/tools/darknet/darknet2ncnn
	doexe ${BUILD_DIR}/tools/mxnet/mxnet2ncnn
	doexe ${BUILD_DIR}/tools/onnx/onnx2ncnn
	doexe ${BUILD_DIR}/tools/quantize/ncnn2int8
	doexe ${BUILD_DIR}/tools/quantize/ncnn2table
}
