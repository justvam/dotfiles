#!/bin/bash

COUNT=$(swaync-client --count)
ENABLED=
DISABLED=
if [ $COUNT != 0 ]; then DISABLED=" $COUNT"; fi
if swaync-client --get-dnd | grep -q "false" ; then echo $ENABLED; else echo $DISABLED; fi
