# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Apple monospace font Monaco"
HOMEPAGE="http://www.apple.com/"
SRC_URI="http://nailgun.name/static/dist/${PN}.ttf"

LICENSE="Apple"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="X"

RDEPEND=""
DEPEND=""

S=${WORKDIR}
FONT_S=${WORKDIR}
FONT_SUFFIX="ttf"

src_unpack() {
	cp "${DISTDIR}/${A}" .
}
