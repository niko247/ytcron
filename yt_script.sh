#!/usr/bin/env bash
echo "Running cron for links: $LINKS"
readarray -d \; -t LINKS_ARR <<< "$LINKS"
for (( n=0; n < ${#LINKS_ARR[*]}; n++))
do
  echo "Current link: ${LINKS_ARR[n]}"
  python3 -m youtube_dl --download-archive "/videos/archive" -i -w --yes-playlist -f best -o "/videos/%(playlist)s/%(title)s-%(id)s.%(ext)s" "${LINKS_ARR[n]}"
done
