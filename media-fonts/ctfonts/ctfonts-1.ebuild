# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit font

DESCRIPTION="Microsoft ClearType Fonts Collection"
HOMEPAGE="http://www.ascendercorp.com/ctfonts.html"
SRC_URI=""
SCP_SRC_PATH="wae.org.ru:/mnt/ware/system/products-local/ctfonts-1.tar.bz2"

LICENSE="MSttfEULA"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="X"

DEPEND=""
RDEPEND=""

S=${WORKDIR}
FONT_S=${WORKDIR}
FONT_SUFFIX="ttf"

src_unpack() {
	echo ">>> Fetching ${P} from ${SCP_SRC_PATH}"
	scp ${SCP_SRC_PATH} ${DISTDIR}
	tar -xf ${DISTDIR}/${P}.tar.bz2 \
		|| die "failed to unpack ${P}.tar.bz2"
}
