# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit qt4-r2

DESCRIPTION="ThinReports Layout Designer"
HOMEPAGE="http://www.thinreports.org/features/editor/"
SRC_URI="https://github.com/thinreports/thinreports-editor/tarball/${PV} -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
    x11-libs/qt-core
    x11-libs/qt-gui
    >=x11-libs/qt-webkit-4.7.4"

MAKEOPTS="${MAKEOPTS} -j1"

DOCSDIR="${S}/"
DOCS="LICENSE GPLv3 README.md"

src_unpack() {
	unpack ${A}
	mv thinreports-thinreports-editor-* ${P} || die
}

src_prepare() {
	epatch "${FILESDIR}"/${P}-platform-linux.patch
}

src_configure() {
    eqmake4 "${S}"/application/application.pro
}
