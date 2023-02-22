#!/bin/sh

set -e
set -u

git config --global --add safe.directory "${PWD}"

if [ "${INPUT_KEY:+x}" = 'x' ]; then
	if [ "${INPUT_KEY_ENCODED:+x}" = 'x' ]; then
		echo 'Either "key" or "key_encoded" should be specified, not both'
		exit 1
	fi

	echo "${INPUT_KEY}" | git-crypt unlock -
	exit 0
fi

if [ "${INPUT_KEY_ENCODED:+x}" = 'x' ]; then
	echo "${INPUT_KEY_ENCODED}" | base64 -d | git-crypt unlock -
	exit 0
fi

echo 'Neither "key" or "key_encoded" specified, aborting'
exit 1
