#!/usr/bin/fish

set -l BLUR_CACHE_PATH "$HOME/.cache/wpp/$argv[1]_blured.JPG"
if not test -f "$BLUR_CACHE_PATH"
    set -l CACHE_IMG "$HOME/.cache/wpp/$argv[1].JPG"
    magick convert -scale 10% -blur 0x1.0 -resize 1000% "$CACHE_IMG" "$BLUR_CACHE_PATH"
end

swaybg -i "$BLUR_CACHE_PATH"
