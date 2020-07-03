#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

cd package/

DEPENDS=$( echo $(sed -e '/^#.*$/d; /^$/d; /^[[:space:]].*$/d' dependencies) | tr ' ' ',')

GIT_COMMIT=$(git rev-parse --short HEAD)

> configuration printf "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://nxos.org" \
	"" \
	"Package: nitrux-minimal" \
	"Version: 0.1.21-${GIT_COMMIT}" \
	"Maintainer: Uri Herrera <uri_herrera@nxos.org>" \
	"Depends: $DEPENDS" \
	"Architecture: amd64" \
	"Description: Minimal Core of Nitrux."

equivs-build configuration
