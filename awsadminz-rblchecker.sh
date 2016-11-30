#!/bin/bash
#Author  : Jobin Joseph
#Website : JobinJoseph.com
#Blog    : www.AWSadminz.com
###############################

# You can copy this script in /etc/cron.hourly or via a crontab entry.
# This script will list the available / configured IPs on the server and will check against 40+ RBLs.
# Thanks to rbl-check.org for the API

JBIPS=/tmp/blacklistedip
JMAIL="your-email-id@gmail.com"


#checking against RBL's
for JIP in `ifconfig|grep "inet addr" |awk '{print $2}'|cut -d":" -f2 |egrep -v "^10\.|^127\."` ; do
JOP=`curl http://rbl-check.org/rbl_api.php?ipaddress=$JIP |egrep -v "notlisted|INPS" | grep -i "listed"`

if [ $? -eq 0 ] ; then
touch $JBIPS
echo "$JIP" >> $JBIPS
echo "===============" >> $JBIPS
echo $JOP | tr ";" " " >> $JBIPS
echo -e >> $JBIPS
else
echo "IP $JIP is safe"
fi
done


#Send email if IPs in blacklist
if [ -e $JBIPS ] ; then
cat $JBIPS | mail -s "[ALERT] - `hostname` IPs is in RBL list" $JMAIL
rm -f $JBIPS
fi

exit 0
