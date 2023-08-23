script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/commom.sh
echo -e '\e[36m>>>>> disable my sql <<<<<\e[0m'
yum module disable mysql -y
echo -e '\e[36m>>>>> redis copy service file  <<<<<\e[0m'
cp ${script_path}/mysql.service /etc/yum.repos.d/mysql.repo
echo -e '\e[36m>>>>> install mysql <<<<<\e[0m'
yum install mysql-community-server -y
echo -e '\e[36m>>>>> reload and restat   <<<<<\e[0m'
systemctl enable mysqld
systemctl restart mysqld
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1

