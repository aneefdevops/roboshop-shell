source ${script_path}/commom.sh
script_path=$(dirname $0)
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
echo -e '\e[36m>>>>> install server  <<<<<\e[0m'
yum install rabbitmq-server -y
echo -e '\e[36m>>>>> reload and stat   <<<<<\e[0m'
systemctl enable rabbitmq-server
systemctl start rabbitmq-server
echo -e '\e[36m>>>>> add user   <<<<<\e[0m'
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
