#!/usr/bin/bash 

script_directory=$(dirname -- "$0") 

echo "Linking crontab for prosdkr"
sudo ln -sf $script_directory/prosdkr /var/spool/cron/prosdkr 
