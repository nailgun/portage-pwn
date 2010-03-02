# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Mount a directory to another location and alter permission bits."
HOMEPAGE="http://code.google.com/p/bindfs/"
SRC_URI="http://bindfs.googlecode.com/files/bindfs-1.8.4.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc ChangeLog README TODO || die
}
