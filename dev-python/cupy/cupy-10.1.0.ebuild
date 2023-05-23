# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1 git-r3

DESCRIPTION="NumPy-like API accelerated with CUDA "
HOMEPAGE="https://github.com/cupy/cupy"
EGIT_REPO_URI="https://github.com/cupy/cupy.git"
EGIT_COMMIT=v$PV

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=dev-python/numpy-1.18[${PYTHON_USEDEP}]
	<dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/fastrlock-0.5[${PYTHON_USEDEP}]
	dev-util/nvidia-cuda-toolkit[profiler]
"
DEPEND="${RDEPEND}"

src_prepare() {
	default

	addpredict /dev/nvidiactl
}
