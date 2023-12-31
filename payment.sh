script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/commom.sh
rabbitmq_adduser_password=$1
echo -e '\e[36m>>>>> install python36   <<<<<\e[0m'
yum install python36 gcc python3-devel -y
echo -e '\e[36m>>>>> useradd <<<<<\e[0m'
useradd ${app_user}
echo -e '\e[36m>>>>> remove zip   <<<<<\e[0m'
rm -rf /app
mkdir /app
echo -e '\e[36m>>>>> unzip  <<<<<\e[0m'
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
cd /app
echo -e '\e[36m>>>>> install requirements  <<<<<\e[0m'
pip3.6 install -r requirements.txt
echo -e '\e[36m>>>>> copy service  file <<<<<\e[0m'
sed -i -e "s|rabbitmq_adduser_password|${rabbitmq_adduser_password}|" ${script_path}/payment.service
cp ${script_path}/payment.service /etc/systemd/system/payment.service
echo -e '\e[36m>>>>> start payment <<<<<\e[0m'
systemctl daemon-reload
systemctl enable payment
systemctl start payment
