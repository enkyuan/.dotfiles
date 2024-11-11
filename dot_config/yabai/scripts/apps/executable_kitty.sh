#!/bin/bash

index=$(yabai -m query --displays --display | jq .index)
yabai -m signal --add event=window_created action=" \
  yabai -m window $YABAI_WINDOW_ID --display $index; \
  yabai -m display --focus $index; \
  yabai -m signal --remove 'openkitty'" \
app="kitty" label="openkitty"
/Applications/kitty.app/Contents/MacOS/kitty --single-instance -d ~
