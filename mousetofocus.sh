#!/bin/bash
  unset x y w h id
  eval $(xwininfo -id $(xdotool getactivewindow) |
    sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
           -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
           -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
           -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )
  echo -n "$x $y $w $h"
  let "centerx=$x+$w/2"
  let "centery=$y+$h/2"
  xdotool mousemove $centerx $centery
#
