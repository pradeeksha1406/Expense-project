log_file=/tmp/expense.log

download_and_extract()
{
echo download $component code
curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >> $log_file

echo unzip $component code
unzip /tmp/$component.zip >> $log_file
}
download_and_extract1(){
  echo downloading the backend code
  curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >> $log_file
  downlad
  echo extracting the backed code zip
  unzip /tmp/backend.zip >> $log_file

}
