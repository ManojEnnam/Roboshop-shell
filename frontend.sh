code_dir=$(pwd)

echo -e "\e[35installing NGNIX \e[0m"
yum install nginx -y

echo -e "\e[35Removing old content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[35Downloading Frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[35Extracting Downloaded content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[35Copying  NGNIX config For Roboshop\e[0m"
cp ${code_dir}/configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[35Enabling NGNIX\e[0m"
systemctl enable nginx

echo -e "\e[35Starting NGNIX\e[0m"
systemctl start nginx