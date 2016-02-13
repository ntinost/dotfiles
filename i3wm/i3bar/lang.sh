#!/bin/sh

KEYLANG=$(xkb-switch | awk '{print toupper($0)}')

echo "$KEYLANG" # full text
echo "$KEYLANG" # short text


if [[ "$KEYLANG" = *GR* ]]; then
	#default ocean's blue color is too subtle on contrast to red
	#thus on HSL, S+2 and L+10
	echo \#8299AF
else
	echo \#bf616a
fi

