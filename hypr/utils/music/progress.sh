#!/bin/bash

player="coccoc"
status=$(playerctl -p "$player" status 2>/dev/null)

if [[ "$status" != "Playing" ]]; then
  echo "[ ────────────────────────────── ] Paused"
  exit
fi

pos=$(playerctl -p "$player" position 2>/dev/null | cut -d '.' -f1)
length=$(playerctl -p "$player" metadata mpris:length 2>/dev/null | cut -d '.' -f1)
length=$((length / 1000000)) # convert microseconds to seconds

if [[ -z "$pos" || -z "$length" || "$length" -eq 0 ]]; then
  echo "[ ────────────────────────────── ] --:--"
  exit
fi

# Tăng độ phân giải của thanh progress
bar_length=30
# Sử dụng 8 levels của block characters để tăng độ mượt
blocks=(" " "▏" "▎" "▍" "▌" "▋" "▊" "▉" "█")

# Tính toán vị trí chính xác với 8 mức độ chi tiết
progress_float=$(awk "BEGIN {print ($pos * $bar_length * 8) / $length}")
progress_int=${progress_float%.*}
full_blocks=$((progress_int / 8))
partial_block=$((progress_int % 8))

# Xây dựng thanh progress với partial blocks
bar=""
for ((i = 0; i < bar_length; i++)); do
  if ((i < full_blocks)); then
    bar+="█"
  elif ((i == full_blocks)); then
    bar+="${blocks[$partial_block]}"
  else
    bar+=" "
  fi
done

# Format thời gian
format_time() {
  local m=$(($1 / 60))
  local s=$(($1 % 60))
  printf "%02d:%02d" "$m" "$s"
}

pos_fmt=$(format_time "$pos")
len_fmt=$(format_time "$length")

echo "[ $bar ] $pos_fmt / $len_fmt"
