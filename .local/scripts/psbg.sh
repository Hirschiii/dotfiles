#!/bin/bash

TIME_INTERVAL=30 # Seconds


while [ 1 ]; do
  pscircle --output-height=2160 --output-width=3840 --output=/tmp/pscircle.png
  feh --bg-fill /tmp/pscircle.png
  sleep $TIME_INTERVAL
done
