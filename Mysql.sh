dnf module disable mysql -y
cp mysql.repo /etc/yum.respos.d/mysql.repo

dnf install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass ExpenseApp@1