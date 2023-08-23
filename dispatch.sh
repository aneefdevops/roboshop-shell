script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/commom.sh
echo -e '\e[36m>>>>> install golanf  <<<<<\e[0m'
yum install golang -y
echo -e '\e[36m>>>>> useradd  <<<<<\e[0m'
useradd ${app_user}
echo -e '\e[36m>>>>> remove contnet   <<<<<\e[0m'
rm -rf /app
mkdir /app
echo -e '\e[36m>>>>> unzip  <<<<<\e[0m'
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip
echo -e '\e[36m>>>>> int dispatch  <<<<<\e[0m'
cd /app
go mod init dispatch
go get
go build
echo -e '\e[36m>>>>> copy service file  <<<<<\e[0m'
cp ${script_path}/dispatch.service /etc/systemd/system/dispatch.service
echo -e '\e[36m>>>>> start and enable  <<<<<\e[0m'
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch

