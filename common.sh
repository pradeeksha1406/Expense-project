log_file=/tmp/expense.log

download_and_extract()
{
echo download $component code
curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >> $log_file

echo unzip $component code
unzip /tmp/$component.zip >> $log_file
}
download_and_extract1()
{
echo downloading the backend code
curl -s -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >> $log_file
echo extracting the backed code zip
unzip /tmp/backend.zip >> $log_file
}
status_check(){
  if [ $? -eq 0 ]; then
      echo -e "\e[31mSuccess\e[0m"
      else
      echo -e "\e[31mFailed\e[0m"
      exit 1
        fi

}