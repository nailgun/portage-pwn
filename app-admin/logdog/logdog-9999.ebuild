# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git distutils

EGIT_REPO_URI="git://github.com/nailgun/logdog.git"
EGIT_BRANCH="stable"
EGIT_TREE="stable"

DESCRIPTION="System log maintenance tools."
HOMEPAGE="http://github.com/nailgun/logdog"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND=">=dev-lang/python-2.6"
DEPEND="${RDEPEND}"

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_install()
{
	distutils_src_install
}

pkg_postinst()
{
	distutils_pkg_postinst
}
