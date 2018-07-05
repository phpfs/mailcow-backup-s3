# mailcow-backup-s3

A simple addon for mailcow-dockerized to backup mails and MySQl to AWS S3.

## --> Currently not recommended to use! <--

### Docker Hub
https://hub.docker.com/r/phpfs/mailcow-backup-s3/

### Configuration

To add aws s3 backups to your instance of mailcow-dockerized, add the following at the end of mailcow.conf...
```
# ------------------------------
# Mailcow-Backup-S3 Settings
# ------------------------------
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
AWS_REGION=us-east-1
AWS_BUCKET=s3://backup/mailcow/
S3_CRON_SCHEDULE=0 1 * * *
```

... and this at the end of docker-compose.yml right before `networks` - check spaces!
```yml
    s3-backup-mailcow:
      image: phpfs/mailcow-backup-s3
      volumes:
        - vmail-vol-1:/vmail:ro
      restart: always
      environment:
        - DBNAME=${DBNAME}
        - DBUSER=${DBUSER}
        - DBPASS=${DBPASS}
        - AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
        - AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
        - AWS_REGION=${AWS_REGION}
        - AWS_BUCKET=${AWS_BUCKET}
        - CRON_SCHEDULE=${S3_CRON_SCHEDULE}
        - TIMEZONE=${TZ}
      networks:
        mailcow-network:
          ipv4_address: 172.22.1.245
          aliases:
            - s3-backup
```

Lastly, run:
```bash
docker-compose down
docker-compose pull
docker-compose up -d
```
