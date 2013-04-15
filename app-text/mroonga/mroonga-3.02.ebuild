# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils

MYSQL_VN=`mysql -V | sed -e "s/^.*\(5.5.[0-9]\+\).*$/\\1/g"`

DESCRIPTION="An Embeddable Fulltext Search Engine for MySQL"
HOMEPAGE="http://mroonga.github.io/"
SRC_URI="http://packages.groonga.org/source/mroonga/${P}.tar.gz
http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-${MYSQL_VN}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-db/mysql-5.5.22
           app-text/groonga"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.19"

src_configure() {
	econf \
		--with-mysql-source=../mysql-${MYSQL_VN}/ \
        --with-mysql-config=/usr/bin/mysql_config || die
}

