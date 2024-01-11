source common.sh
component=frontend

echo insatlling nginx
dnf install nginx -y &>>$log_file
# shellcheck disable=SC1073
if [ $? -eq 0 ]; then
  if [ $? -eq 0 ]; then
    echo -e "\e[31mSuccess\e[0m"
    else
    echo -e "\e[31mFailed\e[0m"
      fi

echo copy the expence file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
if [ $? -eq 0 ]; then
  echo -e "\e[31mSuccess\e[0m"
  else
  echo -e "\e[31mFailed\e[0m"
    fi 

echo removing default  fronend code
rm -rf /usr/share/nginx/html/* &>>$log_file
if [ $? -eq 0 ]; then
  echo -e "\e[31mSuccess\e[0m"
  else
  echo -e "\e[31mFailed\e[0m"
    fi 

# shellcheck disable=SC2164
cd /usr/share/nginx/html &>>$log_file

download_and_extract



echo enable nginx
systemctl enable nginx &>>$log_file
if [ $? -eq 0 ]; then
  echo -e "\e[31mSuccess\e[0m"
  else
  echo -e "\e[31mFailed\e[0m"
    fi 

echo start nginx
systemctl start nginx &>>$log_file
if [ $? -eq 0 ]; then
  echo -e "\e[31mSuccess\e[0m"
  else
  echo -e "\e[31mFailed\e[0m"
    fi 

echo restart nginx
systemctl restart nginx &>>$log_file
if [ $? -eq 0 ]; then
  echo -e "\e[31mSuccess\e[0m"
  else
  echo -e "\e[31mFailed\e[0m"
    fi 