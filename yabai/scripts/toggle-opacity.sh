#!/usr/bin/env bash

opacity=$(yabai -m config active_window_opacity)

if [ "$opacity" == "1.0000" ]
then
  yabai -m config active_window_opacity       0.98
  yabai -m config normal_window_opacity       0.90
else
  yabai -m config active_window_opacity       1.00
  yabai -m config normal_window_opacity       1.00
fi
