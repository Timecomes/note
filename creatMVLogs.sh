#!/bin/bash
#tooo much logs   bigerbigerbiger   killthem

date=`date +%Y%m%d`
logpath=/usr/local/nginx/logs
mv $logpath/access.log $logpath/access-$date.log
mv $logpath/error.log $logpath/error-$date.log
kill -USR1 $(cat $logpath/nginx.pid)


##  crontab -e
##  * * * * * /this .sh/




