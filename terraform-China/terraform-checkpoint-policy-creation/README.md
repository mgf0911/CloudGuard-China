# terraform-checkpoint-policy-creation
从同事处复制 https://github.com/preechadev/terraform-checkpoint-policy-creation/
此工具可以给CP管理服务器添加策略和对象等，支持R81或以上版本。
terraform init 做初始化
terraform apply 做执行

terraform.tfvars 文件定义目标管理服务器IP地址，用户名，密码
main.tf 文件定义需要创建的network objects / service object / access_rule 等

This will create a few network objects and rules within the default Standard policy package via Check Point API available.

This code has been tested with R81 version and above.
