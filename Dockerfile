FROM phpfs/s3-go

COPY entry-point.sh /
COPY run-backup.sh /

RUN \
  apk update && \
  apk add mariadb-client && \
  rm /var/cache/apk/* && \
  mkdir /backup && \
  chmod +x /entry-point.sh /run-backup.sh
  
ENTRYPOINT /entry-point.sh
