![Docker Pulls](https://hub.docker.com/repository/docker/akhilrs/postgres-backup)

# postgres-backup

Backup postgres database to the cloud (optional) with periodic rotating backups.

Supports the following Docker architectures: `linux/amd64`.

## Usage


Docker Swarm:
```yaml
version: "3.7"

networks:
  backend_nw:
    driver: overlay
    external: true

services:
  pg_backups:
    image: akhilrs/postgres-backup:latest
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
      resources:
        limits:
          memory: 1G
    environment:
      - SCHEDULE=@every 12h0m0s
      - BACKUP_KEEP_DAYS=1
      - BACKUP_KEEP_WEEKS=1
      - BACKUP_KEEP_MONTHS=1
      - HEALTHCHECK_PORT=80
      - CLOUD_BACKUP=True
      - CLOUD_PROVIDER=AWS
      - AWS_ACCESS_KEY=${AWS_ACCESS_KEY}
      - AWS_SECRET_KEY=${AWS_SECRET_KEY}
      - AWS_S3_BUCKET=${AWS_S3_BUCKET}
      - S3_SUB_FOLDER=${S3_SUB_FOLDER}
      - AWS_REGION=${AWS_REGION}
      - POSTGRES_HOST=${POSTGRES_HOST}
      - POSTGRES_DB=${POSTGRES_DATABASE}
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
      - POSTGRES_EXTRA_OPTS=-Z9 --schema=public --blobs
    volumes:
      - ./postgres-backups:/backups
    networks:
      - backend_nw

```

### Environment Variables

| env variable | description |
|--|--|
| BACKUP_DIR | Directory to save the backup at. Defaults to `/backups`. |
| BACKUP_KEEP_DAYS | Number of daily backups to keep before removal. Defaults to `7`. |
| BACKUP_KEEP_WEEKS | Number of weekkly backups to keep before removal. Defaults to `4`. |
| BACKUP_KEEP_MONTHS | Number of monthly backups to keep before removal. Defaults to `6`. |
| HEALTHCHECK_PORT | Port listening for cron-schedule health check. Defaults to `8080`. |
| CLOUD_BACKUP |  If True, backup will push to supporting cloud system. Requried. |
| CLOUD_PROVIDER | For setting cloud provider configuration, currently supporting providers are Azure and AWS. |
| AZURE_SA_CONNECTION_STRING | Azure storage account connection string. |
| AZURE_SA_CONTAINER | Azure storage account container name. |
| POSTGRES_DB | Comma or space separated list of postgres databases to backup. Required. |
| POSTGRES_DB_FILE | Alternative to POSTGRES_DB, but with one database per line, for usage with docker secrets. |
| POSTGRES_EXTRA_OPTS | Additional options for `pg_dump`. Defaults to `-Z9`. |
| POSTGRES_HOST | Postgres connection parameter; postgres host to connect to. Required. |
| POSTGRES_PASSWORD | Postgres connection parameter; postgres password to connect with. Required. |
| POSTGRES_PASSWORD_FILE | Alternative to POSTGRES_PASSWORD, for usage with docker secrets. |
| POSTGRES_PORT | Postgres connection parameter; postgres port to connect to. Defaults to `5432`. |
| POSTGRES_USER | Postgres connection parameter; postgres user to connect with. Required. |
| POSTGRES_USER_FILE | Alternative to POSTGRES_USER, for usage with docker secrets. |
| SCHEDULE | [Cron-schedule](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules) specifying the interval between postgres backups. Defaults to `@daily`. |


### Manual Backups

By default this container makes daily backups, but you can start a manual backup by running `/backup.sh`:

```sh
$ docker run -e {envs}  akhilrs/postgres-backup /backup.sh
```

### Automatic Periodic Backups

You can change the `SCHEDULE` environment variable in `-e SCHEDULE="@daily"` to alter the default frequency. Default is `daily`.

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).

Folders `daily`, `weekly` and `monthly` are created and populated using hard links to save disk space.
