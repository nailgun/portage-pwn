# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git bash-completion

EGIT_REPO_URI="git://git.gnome.org/jhbuild"

DESCRIPTION="Jhbuild is a tool used to build the whole GNOME desktop from the git source"
HOMEPAGE="http://live.gnome.org/Jhbuild"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="bash-completion"

RDEPEND=">=dev-lang/python-2.3
		 >=dev-libs/glib-2.2.0
		 >=app-text/gnome-doc-utils-0.4.2
		 >=gnome-base/gnome-common-2.3.0"

DEPEND="${RDEPEND}"

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_compile() {
	./autogen.sh --prefix=/usr || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog HACKING MAINTAINERS NEWS README || die
	dodoc sample.jhbuildrc || die
	dobashcompletion contrib/jhbuild_completion.bash ${PN}
}
