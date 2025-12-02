#!/usr/bin/fish

set -l IMG $argv[1]
set -l BLUR_CACHE_PATH "$HOME/.cache/wpp/"$IMG"_blured.JPG"

if test "$IMG" -nt "$BLUR_CACHE_PATH"
    set -l CACHE_IMG "$HOME/.cache/wpp/$IMG.JPG"
    magick convert -scale 10% -blur 0x1.0 -resize 1000% "$CACHE_IMG" "$BLUR_CACHE_PATH"
end

swaybg -i "$BLUR_CACHE_PATH" &
