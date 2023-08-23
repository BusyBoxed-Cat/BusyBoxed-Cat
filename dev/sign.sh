#!/bin/sh

OUT=null.md
HEADER="${HEADER:-# \`... > /dev/null\`\n}"

die() {
	echo "ERROR: ${1:-!?!?!?}"
	exit 1
}

echo "${HEADER}" > "${OUT}"

for i in .unsigned/*.md; do
	gpg --output - --armour --clear-sign "${i}" >> "${OUT}" || die "failed to sign ${i}"
done
