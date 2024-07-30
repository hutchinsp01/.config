#!/usr/bin/env bash

opacity=$(yabai -m config active_window_opacity)

if [ "$opacity" == "1.0000" ]
then
  yabai -m config active_window_opacity       0.70
  yabai -m config normal_window_opacity       0.50
  yabai -m config window_border_blur          on
else
  yabai -m config active_window_opacity       1.00
  yabai -m config normal_window_opacity       1.00
  yabai -m config window_border_blur          off
fi
