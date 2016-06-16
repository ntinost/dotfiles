#!/bin/sh

KEYLANG=$(xkb-switch | awk '{print toupper($0)}')

echo "$KEYLANG" # full text
echo "$KEYLANG" # short text


if [[ "$KEYLANG" = *GR* ]]; then
	echo \#268BD2
else
	echo \#DC322F
fi

