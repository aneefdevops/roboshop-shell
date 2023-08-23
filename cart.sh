script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/commom.sh
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e '\e[36m>>>>> install nodejs <<<<<\e[0m'
yum install nodejs -y
echo -e '\e[36m>>>>> useradd  <<<<<\e[0m'
useradd ${app_user}
echo -e '\e[36m>>>>> unzip  <<<<<\e[0m'
rm -rf /app
mkdir /app
echo -e '\e[36m>>>>> cart zip  <<<<<\e[0m'
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
echo -e '\e[36m>>>>> nmp intall  <<<<<\e[0m'
cd /app
npm install
cp ${script_path}/cart.service /etc/systemd/system/cart.service
echo -e '\e[36m>>>>> start and reload <<<<<\e[0m'
systemctl daemon-reload
systemctl enable cart
systemctl start cart
