script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/commom.sh
component=user
func_nodejs

echo -e '\e[36m>>>>> download depe  <<<<<\e[0m'
cp $script_path/mangodb.repo /etc/yum.repos.d/mongo.repo
echo -e '\e[36m>>>>> install mangodb  <<<<<\e[0m'
yum install mongodb-org-shell -y
mongo --host mangodb.aneefdevops.online </app/schema/user.js


