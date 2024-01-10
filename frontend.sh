source common.sh
component=frontend

echo insatlling nginx
dnf install nginx -y &>>$log_file

echo copy the expence file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file

echo removing default  fronend code
rm -rf /usr/share/nginx/html/* &>>$log_file

# shellcheck disable=SC2164
cd /usr/share/nginx/html &>>$log_file

download_and_extract


echo enable nginx
systemctl enable nginx &>>$log_file

echo start nginx
systemctl start nginx &>>$log_file

echo restart nginx
systemctl restart nginx &>>$log_file