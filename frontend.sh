Echo insatlling nginx
dnf install nginx -y > /tmp/expense.log

echo copy the expence file
cp expense.conf /etc/nginx/default.d/expense.conf > /tmp/expense.log

echo removing default  fronend code
rm -rf /usr/share/nginx/html/* > /tmp/expense.log

echo download frontend code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip > /tmp/expense.log

# shellcheck disable=SC2164
cd /usr/share/nginx/html > /tmp/expense.log

echo unzip frontend code
unzip /tmp/frontend.zip > /tmp/expense.log

echo enable nginx
systemctl enable nginx > /tmp/expense.log

echo start nginx
systemctl start nginx > /tmp/expense.log

echo restart nginx
systemctl restart nginx > /tmp/expense.log