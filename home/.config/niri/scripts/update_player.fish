#!/usr/bin/fish

playerctl -F metadata --format "{{playerName}} {{title}}" | while read data
    set -l player (echo "$data" | cut -d ' ' -f 1)

    if [ "$player" = firefox ]
        set -l title (echo "$data" | cut -d ' ' -f 2-)
        for fullname in (playerctl -l)
            set -l actual_title (playerctl -p "$fullname" metadata --format {{title}})
            if [ "$title" = "$actual_title" ]
                set player "$fullname"
                break
            end
        end
    end

    echo "$player" | tee ~/.cache/player.cache
end
