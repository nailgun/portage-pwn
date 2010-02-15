# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Leechmod by Nail

inherit base eutils toolchain-funcs flag-o-matic libtool

DESCRIPTION="LibTorrent is a BitTorrent library written in C++ for *nix. Leechmod."
HOMEPAGE="http://libtorrent.rakshasa.no/"
SRC_URI="http://libtorrent.rakshasa.no/downloads/libtorrent-${PV}.tar.gz"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 hppa ~ia64 ppc ppc64 ~sparc x86 ~x86-fbsd"

IUSE="debug ipv6"

RDEPEND=">=dev-libs/libsigc++-2.2.2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	!net-libs/libtorrent"

PATCHES=( "${FILESDIR}/libtorrent-${PV}-gcc44.patch"
          "${FILESDIR}/libtorrent-${PV}-leechmod.patch" )

S="${WORKDIR}/libtorrent-${PV}"

src_unpack() {
	base_src_unpack
	cd "${S}"
	elibtoolize #Don't remove. Needed for *bsd.
}

src_compile() {
	replace-flags -Os -O2

	if [[ $(tc-arch) = "x86" ]]; then
		filter-flags -fomit-frame-pointer -fforce-addr
	fi

	econf \
		$(use_enable debug) \
		$(use_enable ipv6) \
		--enable-aligned \
		--enable-static \
		--enable-shared \
		--disable-dependency-tracking \
		|| die "econf failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS NEWS README
}

pkg_postinst() {
	einfo "You must append net-libs/libtorrent-${PV} to"
	einfo "/etc/portage/profile/package.provided file."
}
