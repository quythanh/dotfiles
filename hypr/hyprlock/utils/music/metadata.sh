#!/bin/bash

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [[ -n "$artist" && -n "$title" ]]; then
  artist_spaced=$(echo " $artist" | sed "s/./& /g")
  title_spaced=$(echo "$title " | sed "s/./& /g")

  echo "${title_spaced}"
else
  commandecho "Nothing Playing"
fi
