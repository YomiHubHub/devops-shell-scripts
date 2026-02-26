#!/bin/bash

APP_DIR="/var/www/myapp"
BRANCH="main"
SERVICE_NAME="myapp"
LOG_FILE="/var/log/deploy.log"

echo "====================================" >> $LOG_FILE
echo "Deployment started at $(date)" >> $LOG_FILE

cd $APP_DIR || exit 1

echo "Pulling latest code..." >> $LOG_FILE
git fetch origin
git checkout $BRANCH
git pull origin $BRANCH

if [ $? -ne 0 ]; then
    echo "Git pull failed!" >> $LOG_FILE
    exit 1
fi

echo "Installing dependencies..." >> $LOG_FILE
npm install --production

echo "Restarting service..." >> $LOG_FILE
sudo systemctl restart $SERVICE_NAME

sleep 3

sudo systemctl status $SERVICE_NAME > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Deployment successful at $(date)" >> $LOG_FILE
else
    echo "Service failed to start!" >> $LOG_FILE
    exit 1
fi

echo "Deployment finished."
