# Copyright 2009 Dmitry Bashkatov
# Distributed under the terms of the GNU General Public License v2

inherit git

EGIT_REPO_URI="git://github.com/ry/node.git"

DESCRIPTION="Evented I/O for v8 javascript."
HOMEPAGE="http://nodejs.org/"
SRC_URI=""

LICENSE="MIT GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test gnutls"

DEPEND=">=dev-lang/python-2.4
		${RDEPEND}"
RDEPEND="gnutls? (
			net-libs/gnutls
			dev-libs/libgpg-error
		)"

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_compile() {
	./configure --prefix=/usr || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog README LICENSE || die
}
