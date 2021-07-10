#!/usr/bin/env bash
echo "Running entry.sh script"
date +'%T'
declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env
echo "Cron will start"
cron && echo "Cron started" && tail -f /var/log/cron.log && echo "Tail finished"