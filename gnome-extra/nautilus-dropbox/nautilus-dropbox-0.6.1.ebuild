# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Dropbox extension for Nautilus"
HOMEPAGE="http://www.dropbox.com/"
SRC_URI="http://www.dropbox.com/download?dl=packages/nautilus-dropbox-0.6.1.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="gnome-base/nautilus x11-libs/libnotify"
RDEPEND="${DEPEND}"

src_configure() {
	./configure --prefix=/usr || die "configure failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog NEWS README || die
}
