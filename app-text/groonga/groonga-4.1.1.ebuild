# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils user

DESCRIPTION="An Embeddable Fulltext Search Engine"
HOMEPAGE="http://groonga.org/"
SRC_URI="http://packages.groonga.org/source/groonga/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="abort aio benchmark debug dynamic-malloc-change +exact-alloc-count fmalloc futex libedit libevent lzo mecab msgpack munin +nfkc ruby sphinx static-libs zeromq zlib"

RDEPEND="benchmark? ( >=dev-libs/glib-2.8 )
	libedit? ( >=dev-libs/libedit-3 )
	libevent? ( dev-libs/libevent )
	lzo? ( dev-libs/lzo )
	mecab? ( >=app-text/mecab-0.80 )
	msgpack? ( dev-libs/msgpack )
    munin? ( net-analyzer/munin )
	ruby? ( dev-lang/ruby )
	sphinx? ( >=dev-python/sphinx-1.1.2 )
	zeromq? ( net-libs/zeromq )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.19
	sphinx? ( dev-python/sphinx )"

pkg_setup() {
	enewuser groonga || die
}

src_configure() {
	econf \
		$(use_enable abort) \
		$(use_enable aio) \
		$(use_enable benchmark) \
		$(use_enable debug memory-debug) \
		$(use_enable dynamic-malloc-change) \
		$(use_enable exact-alloc-count) \
		$(use_enable fmalloc) \
		$(use_enable futex) \
		$(use_enable libedit) \
		$(use_with libevent) \
		$(use_with lzo) \
		$(use_with mecab) \
		$(use_with msgpack) \
		$(use_with munin) \
		$(use_enable nfkc) \
		$(use_with ruby) \
		$(use_with sphinx sphinx-build) \
		$(use_enable static-libs static) \
		$(use_enable zeromq) \
		$(use_with zlib) || die
}

src_install() {
	emake DESTDIR="${D}" install || die

	keepdir /var/{log,spool}/${PN} || die
	fowners groonga:groonga /var/{log,spool}/${PN} || die

	dodoc README.md || die
}
