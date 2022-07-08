#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"Package: nitrux-minimal-legacy" \
	"Version: 0.3.2-$git_commit" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $deps" \
	"Conflicts: nitrux-minimal" \
	"Architecture: all" \
	"Description: Minimal Core of Nitrux."

equivs-build configuration
