# 腾讯云部署terraform测试脚本
terraform init 做初始化
terraform apply 做执行
terraform destroy 做删除
————————————————————————————————————
Windows 环境变量
set TF_LOG=DEBUG
set TF_LOG_PATH=./terraform.log
set TENCENTCLOUD_SECRET_ID=xxxxxxxxxxxxxxxXt0xfJjS
set TENCENTCLOUD_SECRET_KEY=xxxxxxxxxxxxxxxxxxxzLYYNwRjrt
set TENCENTCLOUD_REGION=ap-shanghai
——————————————————————————————————————————————
Linux 环境变量
export TF_LOG=DEBUG
export TF_LOG_PATH=./terraform.log
export TENCENTCLOUD_SECRET_ID=xxxxxxxxxxxxxxxXt0xfJjS
export TENCENTCLOUD_SECRET_KEY=xxxxxxxxxxxxxxxxxxxzLYYNwRjrt
export TENCENTCLOUD_REGION=ap-shanghai
————————————————————————————————————————————————————————
provider.tf 有定义密钥的变量