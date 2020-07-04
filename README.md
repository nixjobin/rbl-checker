# rbl-checker

### Requirements
The script will work on any Linux Operating system

Commands
* ifconfig
* curl

### How to Install
<pre>cd /etc/cron.hourly && wget https://raw.githubusercontent.com/nixjobin/rbl-checker/master/nixhive-rblchecker.sh -O nixhive-rblchecker.sh && chmod +x nixhive-rblchecker.sh </pre>

Now the script will run every hour on from your server.

#### Email Notification

Replace the below one with your email address on the script.

JMAIL="your-email-id@gmail.com"

