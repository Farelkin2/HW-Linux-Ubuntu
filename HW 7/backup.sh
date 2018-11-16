### Script for backup
### Get day of week. (1..7); 1 is Monday
dow=`date '+%u'`
### Get day of month (e.g., 01)
dom=`date '+%d'`
### Backup folders
src_dir=test_files
bak_daily_dir=backup/daily
bak_weekly_dir=backup/weekly
bak_monthly_dir=backup/montly
### Rotate time
rotate_daily_days=7
rotate_weekly_days=30
rotate_monthly_days=180
### Test for backup folders
[ -d ${bak_daily_dir} ] || mkdir ${bak_daily_dir}
[ -d ${bak_weekly_dir} ] || mkdir ${bak_weekly_dir}
[ -d ${bak_monthly_dir} ] || mkdir ${bak_monthly_dir}
### Function for daily backup
function daily_backup
{
cp -p ${src_dir}/* ${bak_daily_dir}
}
### Function for weekly backup
function weekly_backup
{
cp -p ${src_dir}/* ${bak_weekly_dir}
}
### Function for monthly backup
function monthly_backup
{
cp -p ${src_dir}/* ${bak_monthly_dir}
}
### Test what backup to do
if [ ${dom} -eq "01" ]
then
monthly_backup
elif [ ${dow} -eq "5" ]
then
weekly_backup
else
daily_backup
fi
### Delete old backups
find ${bak_daily_dir} -type f -mtime +${rotate_daily_days} -delete
find ${bak_weekly_dir} -type f -mtime +${rotate_weekly_days} -delete
find ${bak_monthly_dir} -type f -mtime +${rotate_monthly_days} -delete

