# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Microsoft ClearType Fonts Collection"
HOMEPAGE="http://www.ascendercorp.com/ctfonts.html"
SRC_URI="http://nailgun.name/static/dist/${P}.tar.bz2"

LICENSE="MSttfEULA"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="X"

RDEPEND=""
DEPEND=""

S=${WORKDIR}
FONT_S=${WORKDIR}
FONT_SUFFIX="ttf"
