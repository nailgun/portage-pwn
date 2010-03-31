# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="V8 JavaScript Engine."
HOMEPAGE="http://code.google.com/p/v8/"
SRC_URI=""

ESVN_REPO_URI="http://v8.googlecode.com/svn/trunk/"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="readline"

RDEPEND="readline? ( sys-libs/readline )"
DEPEND=">=dev-lang/python-2.4
		>=dev-util/scons-1.0.0
		${RDEPEND}"

src_unpack() {
	subversion_src_unpack
	cd "${S}"
}

src_compile() {
	if use readline; then
		console=readline
	else
		console=dumb
	fi

	scons library=shared console=${console} library d8
}

src_install() {
	dolib libv8.so
	dobin d8
	dodoc AUTHORS ChangeLog
}
