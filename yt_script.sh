#!/usr/bin/env bash
echo "Running cron for links: $LINKS"
readarray -d \; -t LINKS_ARR <<< "$LINKS"
for (( n=0; n < ${#LINKS_ARR[*]}; n++))
do
  echo "Current link: ${LINKS_ARR[n]}"
  yt-dlp --download-archive "/videos/archive" --ignore-errors --no-overwrites --yes-playlist -f best/bestvideo+bestaudio -o "/videos/%(playlist)s/%(title)s-%(id)s.%(ext)s" "${LINKS_ARR[n]}"
done
