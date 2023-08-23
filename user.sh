source commom.sh
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e '\e[36m>>>>> install nodejs  <<<<<\e[0m'
yum install nodejs -y
echo -e '\e[36m>>>>> add application  <<<<<\e[0m'
useradd ${app_user}
echo -e '\e[36m>>>>> app setup  <<<<<\e[0m'
rm -rf /app
mkdir /app
echo -e '\e[36m>>>>> application code <<<<<\e[0m'
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
echo -e '\e[36m>>>>> download depe  <<<<<\e[0m'
cd /app
npm install
echo -e '\e[36m>>>>> add repo  <<<<<\e[0m'
cp /home/centos/roboshop-shell/user.service /etc/systemd/system/user.service
echo -e '\e[36m>>>>> enable and start  <<<<<\e[0m'
systemctl daemon-reload
systemctl enable user
systemctl start user
echo -e '\e[36m>>>>> download depe  <<<<<\e[0m'
cp /home/centos/roboshop-shell/mangodb.repo /etc/yum.repos.d/mongo.repo
echo -e '\e[36m>>>>> install mangodb  <<<<<\e[0m'
yum install mongodb-org-shell -y
mongo --host mangodb.aneefdevops.online </app/schema/user.js


