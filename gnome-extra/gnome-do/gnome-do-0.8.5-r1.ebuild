# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO: GNOME Do defaults to a debug build; to disable, --enable-release must
# be passed. However, when doing this the build fails; figure out why.

EAPI=2

inherit gnome2 mono versionator eutils

PVC=$(get_version_component_range 1-3)

DESCRIPTION="GNOME Do allows you to get things done quickly (with cmigemo)"
HOMEPAGE="http://do.davebsd.com/"
SRC_URI="https://launchpad.net/do/trunk/${PVC}/+download/${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="migemo"

RDEPEND=">=dev-lang/mono-2.0
	>=dev-dotnet/gconf-sharp-2.24.0
	>=dev-dotnet/gtk-sharp-2.12.6
	>=dev-dotnet/glade-sharp-2.12.6
	dev-dotnet/ndesk-dbus
	dev-dotnet/ndesk-dbus-glib
	>=dev-dotnet/gnome-desktop-sharp-2.26.0
	>=dev-dotnet/gnome-keyring-sharp-1.0.0
	>=dev-dotnet/gnome-sharp-2.24.0
	>=dev-dotnet/gnomevfs-sharp-2.24.0
	>=dev-dotnet/wnck-sharp-2.24.0
	>=dev-dotnet/art-sharp-2.24.0
	>=dev-dotnet/rsvg-sharp-2.24.0
    migemo? ( >=app-text/cmigemo-1.3c-r2 )
	dev-dotnet/mono-addins[gtk]
	dev-dotnet/notify-sharp
	!<gnome-extra/gnome-do-plugins-0.8"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	dev-util/pkgconfig"

MAKEOPTS="${MAKEOPTS} -j1"

src_prepare() {
	epatch "${FILESDIR}"/${P}-binding-bugfix.patch
    if use migemo ; then
    	epatch "${FILESDIR}"/${P}-migemo.patch
    fi
}

src_configure() {
	gnome2_src_configure
}

src_compile() {
	default
}

pkg_postinst() {
	gnome2_pkg_postinst
}
