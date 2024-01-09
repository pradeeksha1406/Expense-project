log_file=/tmp/expense.log
echo insatlling nginx
dnf install nginx -y >> $log_file

echo copy the expence file
cp expense.conf /etc/nginx/default.d/expense.conf >> $log_file

echo removing default  fronend code
rm -rf /usr/share/nginx/html/* >> $log_file

echo download frontend code
curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >> $log_file

# shellcheck disable=SC2164
cd /usr/share/nginx/html >> $log_file

echo unzip frontend code
unzip /tmp/frontend.zip >> $log_file

echo enable nginx
systemctl enable nginx >> $log_file

echo start nginx
systemctl start nginx >> $log_file

echo restart nginx
systemctl restart nginx >> $log_file