#!/usr/bin/env python

from collections import defaultdict
from pathlib import Path
import json
import subprocess
import re


players = (
    subprocess.run(["playerctl", "-l"], capture_output=True, encoding="utf-8")
    .stdout.strip()
    .split("\n")
)
players_count = len(players)

if players_count == 0:
    output = {"text": "Stopped 󰝛", "tooltip": "No media is playing"}
    print(json.dumps(output))
    exit(0)

CACHE_FILE = Path.home() / ".cache/player.cache"
with open(CACHE_FILE) as cf:
    active_player = cf.readline().strip()

if active_player not in players:
    active_player = players[0]

if (
    subprocess.run(
        ["playerctl", "status"], capture_output=True, encoding="utf-8"
    ).stdout.strip()
    == "Stopped"
):
    output = {"text": "Stopped 󰝛", "tooltip": "No media is playing"}
    print(json.dumps(output))
    exit(0)

metadata_all = subprocess.run(
    ["playerctl", "-p", active_player, "metadata"],
    capture_output=True,
    encoding="utf-8",
).stdout.split("\n")
data = defaultdict(str)

for metadata in metadata_all:
    field = metadata.split()
    if len(field) < 3:
        continue

    data["player"] = field[0]

    match field[1]:
        case "xesam:artist":
            data["artist"] = metadata.split("xesam:artist")[1].strip()
        case "xesam:title":
            data["title"] = metadata.split("xesam:title")[1].strip()
        case "xesam:album":
            data["album"] = metadata.split("xesam:album")[1].strip()
        case "mpris:length":
            data["length"] = int(field[2]) // 1_000_000
        case "mpris:artUrl":
            data["artUrl"] = field[2]

position = int(
    subprocess.run(
        ["playerctl", "-p", active_player, "position"],
        capture_output=True,
        encoding="utf-8",
    ).stdout.split(".")[0]
)

loop_status = subprocess.run(
    ["playerctl", "-p", active_player, "loop"], capture_output=True, encoding="utf-8"
).stdout.strip()
loop_icon = " " if loop_status == "Track" else ""

shuffle_status = subprocess.run(
    ["playerctl", "-p", active_player, "shuffle"], capture_output=True, encoding="utf-8"
).stdout.strip()
shuffle_icon = " " if shuffle_status == "On" else ""

running_status = subprocess.run(
    ["playerctl", "-p", active_player, "status"], capture_output=True, encoding="utf-8"
).stdout.strip()
running_icon = " " if running_status == "Playing" else " "

if re.match("firefox*", active_player):
    active_player = "firefox"
player_icon = {"mpd": "󰝚 ", "firefox": "󰈹 "}

artist_len = len(data["artist"])
title_len = len(data["title"])
ARTIST_THRESHOLD = 20
TITLE_THRESHOLD = 45

if artist_len + title_len > ARTIST_THRESHOLD + TITLE_THRESHOLD:
    truncated_artist = (
        data["artist"]
        if artist_len <= ARTIST_THRESHOLD
        else "".join([data["artist"][: ARTIST_THRESHOLD - 3], "..."])
    )
    truncated_title = (
        data["title"]
        if title_len <= TITLE_THRESHOLD
        else "".join([data["title"][: TITLE_THRESHOLD - 3], "..."])
    )

    media_format = f"{truncated_artist} - {truncated_title}"
else:
    media_format = f"{data['artist']} - {data['title']}"


def format_duration():
    length = data["length"]
    length_min, length_sec = divmod(length, 60)
    length_hour, length_min = divmod(length_min, 60)

    pos_min, pos_sec = divmod(position, 60)
    pos_hour, pos_min = divmod(pos_min, 60)

    if length_hour != 0:
        return f"{pos_hour:02d}:{pos_min:02d}:{pos_sec:02d}/{length_hour:02d}:{length_min:02d}:{length_sec:02d}"
    else:
        return f"{pos_min:02d}:{pos_sec:02d}/{length_min:02d}:{length_sec:02d}"


output = {
    "text": f"{player_icon.get(active_player, active_player)}{running_icon}{loop_icon}{shuffle_icon}- {media_format} <small>({round(100 * position / data['length'])}%)</small>",
    "tooltip": f"""
 Player: {active_player} ({running_status})
 Artist: {data["artist"]}
 Title: {data["title"]}
 Album: {data["album"]}
 Duration: {format_duration()}
 Number of players: {players_count}
""",
}

print(json.dumps(output))
