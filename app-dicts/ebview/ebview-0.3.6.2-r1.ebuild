# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

IUSE=""

DESCRIPTION="EBView is a GUI program for electronic dictionaries"
HOMEPAGE="http://www.mhatta.org/diary/?date=20090819"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/e/ebview/${P/-/_}.orig.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="x86 ppc amd64"

DEPEND=">=dev-libs/eb-4.2.2
		x11-libs/pangox-compat
"

S="${WORKDIR}/${P%_*}"

src_configure() {
        econf --with-eb-conf=/etc/eb.conf
}

src_install() {
        einstall || die

        dodoc AUTHORS ChangeLog INSTALL NEWS README
}
