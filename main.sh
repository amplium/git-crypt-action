#!/bin/sh

set -e
set -u

if [ "${INPUT_KEY:+x}" = 'x' ]; then
	if [ "${INPUT_KEY_ENCODED:+x}" = 'x' ]; then
		echo 'Either "key" or "key_encoded" should be specified, not both'
		exit 1
	fi

	key="${INPUT_KEY}"
elif [ "${INPUT_KEY_ENCODED:+x}" = 'x' ]; then
	key="$(echo "${INPUT_KEY_ENCODED}" | base64 -d)"
else
	echo 'Neither "key" or "key_encoded" specified, aborting'
	exit 1
fi

git config --global --add safe.directory "${PWD}"

echo "${key}" | git-crypt unlock -
