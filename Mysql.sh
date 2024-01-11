source common.sh

echo disable old version of sql
dnf module disable mysql -y &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi 

echo copy repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi 

echo installing mysql
dnf install mysql-community-server -y &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi 

echo enable mysql
systemctl enable mysqld &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi 

echo start mysql
systemctl start mysqld &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi 

echo set root pass
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi 