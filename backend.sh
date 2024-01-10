source common.sh

echo disable existing nodejs
dnf module disable nodejs -y >> $log_file

echo enable nodejs
dnf module enable nodejs:18 -y >> $log_file

echo installing nodejs
dnf install nodejs -y

echo copy bakend service
cp backend.service /etc/systemd/system/backend.service >> $log_file

ehco useradd
useradd expense >> $log_file

echo making diretory
mkdir /app >> $log_file

echo moving to app directory
cd /app >> $log_file

download_and_extract1

echo relove code dependecieys
npm install >> $log_file


echo system reload after edit in backen config file
systemctl daemon-reload >> $log_file

echo backend
systemctl enable backend >> $log_file

echo bakend start
systemctl start backend >> $log_file

echo installing mysql client
dnf install mysql -y >> $log_file

echo load the schema
mysql -h mysql.techadda.co -uroot -pExpenseApp@1 < /app/schema/backend.sql