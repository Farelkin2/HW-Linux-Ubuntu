#!/bin/sh

BACKUP_SRC=/srv/share/
BACKUP_DST=/backup/
CUR_DATE=`date '+%d-%m-%Y'`
RSYNC_BIN=/usr/bin/rsync

$RSYNC_BIN -a --log-file=/var/log/backup_share.log --stats --progress -rb --backup-dir=${BACKUP_DST}${CUR_DATE}/ ${BACKUP_SRC} ${BACKUP_DST}FULL/