FROM ubuntu:20.10
USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install software-properties-common -y
RUN apt update
RUN apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget python3.9 python3-pip -y
RUN python3 -V
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade youtube_dl
RUN apt update && apt upgrade -y
RUN apt install cron
COPY ytcron /etc/cron.d/ytcron
COPY yt_script.sh /yt_script.sh
COPY entry.sh /entry.sh
RUN chmod 0644 /etc/cron.d/ytcron
RUN chmod +x /yt_script.sh
RUN chmod +x /entry.sh
RUN touch /var/log/cron.log
ENTRYPOINT /entry.sh