source ${script_path}/commom.sh
script_path=$(dirname $0)
echo -e '\e[36m>>>>> install maven <<<<<\e[0m'
yum install maven -y
echo -e '\e[36m>>>>> useradd <<<<<\e[0m'

useradd ${app_user}
echo -e '\e[36m>>>>> start redis <<<<<\e[0m'
rm -rf /app
mkdir /app
echo -e '\e[36m>>>>> unzip shipping   <<<<<\e[0m'

curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
echo -e '\e[36m>>>>> start redis <<<<<\e[0m'
cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar
echo -e '\e[36m>>>>> copy service file  <<<<<\e[0m'
cp ${script_path}/shipping.service /etc/systemd/system/shipping.service
echo -e '\e[36m>>>>> restat and reload  <<<<<\e[0m'
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
echo -e '\e[36m>>>>> install mysql <<<<<\e[0m'
yum install mysql -y
mysql -h mysql.aneefdevops.online -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping
