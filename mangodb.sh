echo -e '\e[36m>>>>> add repo file <<<<<\e[0m'
cp mangodb.repo /etc/yum.repos.d/mongo.repo
echo -e '\e[36m>>>>> install mangodb <<<<<\e[0m'
yum install mongodb-org -y
echo -e '\e[36m>>>>> start and enable <<<<<\e[0m'
systemctl enable mongod
systemctl start mongod
echo -e '\e[36m>>>>> restart <<<<<\e[0m'
systemctl restart mongod
