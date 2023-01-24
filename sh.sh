#!/bin/bash
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

tar -cvf $bkpdir/logs-$(date +%Y-%m-%d).tar $(find $logpath -mmin + $t)