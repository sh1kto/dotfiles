#!/bin/bash

clear
echo "===   System Updates ==="
echo

updates=$(yay -Qu 2>/dev/null)
count=$(echo "$updates" | wc -l)

if [ "$count" -eq 0 ]; then
  echo "Your system is up to date! ✔"
  read -rp "Press enter to close..."
  exit 0
fi

official=$(echo "$updates" | grep -v '\[AUR\]' | wc -l)
aur=$(echo "$updates" | grep '\[AUR\]' | wc -l)

echo "There are $count updates available."
[ "$official" -gt 0 ] && echo " -   $official official"
[ "$aur" -gt 0 ] && echo " -   $aur AUR"

echo
read -rp "Do you want to update now? (y/n): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  yay -Syu
else
  echo "Update canceled."
  sleep 1
fi

