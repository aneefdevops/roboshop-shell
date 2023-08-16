echo -e '\e[36m>>>>> install python36   <<<<<\e[0m'
yum install python36 gcc python3-devel -y
echo -e '\e[36m>>>>> useradd <<<<<\e[0m'
useradd roboshop
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
cp /home/centos/roboshop-shell/payment.service /etc/systemd/system/payment.service
echo -e '\e[36m>>>>> start payment <<<<<\e[0m'
systemctl daemon-reload
systemctl enable payment
systemctl start payment
