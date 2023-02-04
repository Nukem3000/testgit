#!/bin/bash
file=/home/log/arch.tar.gz
Help()
{
   echo "Backup your log files and pack it to tarball."
   echo
   echo "Syntax: backup.sh [-u|H|v|V]"
   echo "options:"
   echo "u     SSH Username."
   echo "H     Remote hostname."
   echo "h     Print this Help."
   echo "b     Backup dir path."
   echo "t     Set the age of the log files in minutes."
   echo "l     Folder with logs to backup."
}

while getopts u:H:h:b:t:l option
do 
    case "${option}"
        in
        h) # display Help
        Help
        exit;;
        u)user=${OPTARG};;
        H)hostname=${OPTARG};;
        b)bkpdir=${OPTARG};;
        t)t=${OPTARG};;
        i)logpath=${OPTARG};;
    esac
done

if test - "arch.tar.gz"
then
  gzip -d arch.tar.gz
  tar uvf /home/logs/arch.tar $(find $logpath -mmin +720) --remove-files
  gzip -9 arch.tar
else
  tar -crvzf /home/logs/arch.tar.gz $(find $logpath -mmin +720) --remove-files
fi

tar -cvf $bkpdir/logs-$(date +%Y-%m-%d).tar $(find $logpath -mmin + $t)

##############################
##############################
##############################

#!/bin/bash
logs=$(ls /home/logs/*.log)
file=/home/log/arch.tar.gz
dat=$(date +%Y-%m-%d)
if test -f "$logs"
then
  echo $dat [NOTHING TO ARCHIVE] >> /home/logs/backup.log
if test -f "$file"
then
  echo $dat [BACKUP STARTED] >> /home/logs/backup.log 2> /dev/null
  gzip -d arch.tar.gz
  tar uvf /home/logs/arch.tar $(find $logpath -mmin +720) --remove-files >> /home/logs/backup.log 2>> /home/logs/backup.log
  gzip -9 arch.tar
else
  tar -cvzf /home/logs/arch.tar.gz $(find $logpath -mmin +720) --remove-files >> /home/logs/backup.log 2>> /home/logs/backup.log
fi
