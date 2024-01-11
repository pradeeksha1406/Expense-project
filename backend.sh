source common.sh


echo disable existing nodejs
dnf module disable nodejs -y &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo enable nodejs
dnf module enable nodejs:18 -y &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo installing nodejs
dnf install nodejs -y
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo copy bakend service
cp backend.service /etc/systemd/system/backend.service &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

ehco useradd
useradd expense &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo making diretory
mkdir /app &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo moving to app directory
cd /app &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

download_and_extract1

echo relove code dependecieys
npm install &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi


echo system reload after edit in backen config file
systemctl daemon-reload &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo backend
systemctl enable backend &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo bakend start
systemctl start backend &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo installing mysql client
dnf install mysql -y &>>$log_file
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi

echo load the schema
mysql -h mysql.techadda.co -uroot -pExpenseApp@1 < /app/schema/backend.sql
if [$? -eq 0];then
  echo success
  else
    echo failed
    fi