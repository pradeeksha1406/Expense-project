source common.sh

echo disable old version of sql
dnf module disable mysql -y &>>$log_file
status_check

echo copy repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
status_check

echo installing mysql
dnf install mysql-community-server -y &>>$log_file
status_check

echo enable mysql
systemctl enable mysqld &>>$log_file
status_check

echo start mysql
systemctl start mysqld &>>$log_file
status_check

echo set root pass
sql_rootpassword=$1
mysql_secure_installation --set-root-pass $sql_rootpassword &>>$log_file
status_check