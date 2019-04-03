# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils

MYSQL_VN=5.7.24

DESCRIPTION="An Embeddable Fulltext Search Engine for MySQL"
HOMEPAGE="http://mroonga.github.io/"
SRC_URI="http://packages.groonga.org/source/mroonga/${P}.tar.gz
http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-${MYSQL_VN}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-db/mysql-${MYSQL_VN}
          =app-text/groonga-9.0.1"
DEPEND="${RDEPEND}
        virtual/pkgconfig"

src_configure() {
    pushd ../mysql-${MYSQL_VN}
    cmake . -DDOWNLOAD_BOOST=1 -DWITH_BOOST=./
    make mysqlservices
    popd
    
    econf \
        --with-mysql-source=../mysql-${MYSQL_VN}/ \
        --with-mysql-build=../mysql-${MYSQL_VN}/ \
        --with-mysql-config=/usr/bin/mysql_config
}

