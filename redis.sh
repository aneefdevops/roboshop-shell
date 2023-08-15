echo -e '\e[36m>>>>> redis repo file  <<<<<\e[0m'
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e '\e[36m>>>>> enable redis  <<<<<\e[0m'
yum module enable redis:remi-6.2 -y
echo -e '\e[36m>>>>> install redis  <<<<<\e[0m'
yum install redis -y
echo -e '\e[36m>>>>> 127.0.0.1 to 0.0.0.0 <<<<<\e[0m'
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf
echo -e '\e[36m>>>>> start redis <<<<<\e[0m'
systemctl enable redis
systemctl start redis

