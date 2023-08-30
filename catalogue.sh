script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/commom.sh

component=catalogue
func_nodejs

cp ${script_path}/mangodb.repo /etc/yum.repos.d/mongo.repo
echo -e '\e[36m>>>>> install mangodb  <<<<<\e[0m'

yum install mongodb-org-shell -y
mongo --host mangodb.aneefdevops.online </app/schema/catalogue.js


