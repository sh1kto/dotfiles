#!/bin/bash

updates=$(yay -Qu 2>/dev/null | wc -l)

if [ "$updates" -eq 0 ]; then
  echo "󰏗  0"
else
  echo "$updates"
fi

