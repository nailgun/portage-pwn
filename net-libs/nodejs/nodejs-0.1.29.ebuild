# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Evented I/O for v8 javascript."
HOMEPAGE="http://nodejs.org/"
SRC_URI="http://nodejs.org/dist/node-v0.1.29.tar.gz"

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

S="${WORKDIR}/node-v${PV}"

src_compile() {
	./configure --prefix=/usr || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc ChangeLog README LICENSE || die
}
