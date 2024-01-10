source common.sh

echo disable old version of sql
dnf module disable mysql -y >> $log_file

echo copy repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo >> $log_file

echo installing mysql
dnf install mysql-community-server -y >> $log_file

echo enable mysql
systemctl enable mysqld >> $log_file

echo start mysql
systemctl start mysqld >> $log_file

echo set root pass
mysql_secure_installation --set-root-pass ExpenseApp@1 >> $log_file