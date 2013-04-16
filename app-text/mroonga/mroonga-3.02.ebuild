# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils

MYSQL_VN=5.5.30

DESCRIPTION="An Embeddable Fulltext Search Engine for MySQL"
HOMEPAGE="http://mroonga.github.io/"
SRC_URI="http://packages.groonga.org/source/mroonga/${P}.tar.gz
http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-${MYSQL_VN}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-db/mysql-${MYSQL_VN}
           app-text/groonga"
DEPEND="${RDEPEND}
	    virtual/pkgconfig"

src_configure() {
	econf \
		--with-mysql-source=../mysql-${MYSQL_VN}/ \
        --with-mysql-config=/usr/bin/mysql_config
}

