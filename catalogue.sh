source ${script_path}/commom.sh
script_path=$(dirname $0)
echo -e '\e[36m>>>>> setup nodejs <<<<<\e[0m'

curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e '\e[36m>>>>> install nodeja <<<<<\e[0m'

yum install nodejs -y

echo -e '\e[36m>>>>> add user <<<<<\e[0m'

useradd ${app_user}

echo -e '\e[36m>>>>> setup app  <<<<<\e[0m'

rm -rf /app
mkdir /app
echo -e '\e[36m>>>>> application code  <<<<<\e[0m'
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
echo -e '\e[36m>>>>> download depe  <<<<<\e[0m'
cd /app
npm install
echo -e '\e[36m>>>>> app repo  <<<<<\e[0m'
cp  ${script_path}/catalogue.service /etc/systemd/system/catalogue.service
echo -e '\e[36m>>>>> reload  <<<<<\e[0m'
systemctl daemon-reload
echo -e '\e[36m>>>>> reload  <<<<<\e[0m'
systemctl enable catalogue
systemctl start catalogue
cp ${script_path}/mangodb.repo /etc/yum.repos.d/mongo.repo
echo -e '\e[36m>>>>> install mangodb  <<<<<\e[0m'

yum install mongodb-org-shell -y
mongo --host mangodb.aneefdevops.online </app/schema/catalogue.js


