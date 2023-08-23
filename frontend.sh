source ${script_path}/commom.sh
script_path=$(dirname $0)
echo -e '\e[36m>>>>>install nginx<<<<<\e[0m'
yum install nginx -y
systemctl enable nginx
systemctl start nginx
echo -e '\e[36m>>>>>remove content <<<<<\e[0m'
rm -rf /usr/share/nginx/html/*
echo -e '\e[36m>>>>>dowmload frontend content <<<<<\e[0m'
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e '\e[36m>>>>> extract frontend content <<<<<\e[0m'
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e '\e[36m>>>>> add repo file <<<<<\e[0m'
cp ${script_path}/roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e '\e[36m>>>>> restat  <<<<<\e[0m'
systemctl restart nginx
