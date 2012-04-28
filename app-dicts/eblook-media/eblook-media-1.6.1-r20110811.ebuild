# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

IUSE=""

DESCRIPTION="EBlook is an interactive search utility for electronic dictionaries. (media extension)"
HOMEPAGE="http://ikazuhiro.s206.xrea.com/staticpages/index.php/eblook"
SRC_URI="http://ikazuhiro.s206.xrea.com/filemgmt/visit.php/156 -> ${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="x86 ppc amd64"

DEPEND=">=dev-libs/eb-4.2.2"

src_unpack() {
    unpack ${A}
    mv eblook-* ${P} || die
}

src_configure() {
        econf --with-eb-conf=/etc/eb.conf
}

src_install() {
        einstall || die

        dodoc AUTHORS ChangeLog INSTALL NEWS README
}
