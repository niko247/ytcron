FROM python:3.11
RUN apt update && apt upgrade -y
RUN apt install cron -y
RUN pip install --upgrade pip
RUN pip install yt-dlp
RUN which cron
COPY ytcron /etc/cron.d/ytcron
COPY yt_script.sh /yt_script.sh
COPY entry.sh /entry.sh
RUN chmod 0644 /etc/cron.d/ytcron
RUN chmod +x /yt_script.sh
RUN chmod +x /entry.sh
RUN touch /var/log/cron.log
RUN crontab /etc/cron.d/ytcron
ENTRYPOINT /entry.sh