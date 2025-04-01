# ytcron
Allows to download videos from YT with cron job which can be run every day
## Requirements
Installed docker and docker compose

## Quick start
1. Change docker-compose.yml file by editing environment variable LINKS value ('URL_TO_CHANNELS_OR_PLAYLISTS')
  Links must be separated with semicolon if there are multiple links, it can be link to playlist or just to video, or even to channel (in case of channel be careful it will download everything with subscriptions too)
2. (Optional) Modify ytcron file if you want to change cron job time - time when yt videos will be downloaded in UTC time, by default it's set to 20:20 UTC time. 
You can use https://crontab.guru/
3. Run build.sh, if you have windows run command from this file.
4. In WSL run this in docker-compose.yml folder where videos will be stored: ```sudo chmod -R 777 ./videos/```
5. Open folder containing docker-compose.yml in command line/bash and run command ```docker compose up -d``` You can copy docker-compose.yml to other location in new folder because in that folder there will be created folder "videos" with content of all videos and links cache.

## General info
It will not download files again if your files were downloaded
It ignores errors if video in playlist is removed
