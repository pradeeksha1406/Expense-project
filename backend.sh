source common.sh


echo disable existing nodejs
dnf module disable nodejs -y &>>$log_file
status_check

echo enable nodejs
dnf module enable nodejs:18 -y &>>$log_file
status_check

echo installing nodejs
dnf install nodejs -y
status_check

echo copy bakend service
cp backend.service /etc/systemd/system/backend.service &>>$log_file
status_check

ehco add application user
id expense &>>$log_file
if [ $? -ne 0 ]; then
useradd expense &>>$log_file
fi
status_check

echo making diretory
mkdir /app &>>$log_file
status_check

echo moving to app directory
cd /app &>>$log_file
status_check

download_and_extract1

echo relove code dependecieys
npm install &>>$log_file
status_check


echo system reload after edit in backen config file
systemctl daemon-reload &>>$log_file
status_check

echo backend
systemctl enable backend &>>$log_file
status_check

echo bakend start
systemctl start backend &>>$log_file
status_check

echo installing mysql client
dnf install mysql -y &>>$log_file
status_check

echo load the schema
mysql -h mysql.techadda.co -uroot -pExpenseApp@1 < /app/schema/backend.sql
status_check