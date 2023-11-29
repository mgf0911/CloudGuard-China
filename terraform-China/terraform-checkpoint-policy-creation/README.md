# terraform-checkpoint-policy-creation
从同事处复制的terraform模板 https://github.com/preechadev/terraform-checkpoint-policy-creation/
进行了大规模的完善
此工具可以给CP管理服务器添加策略和对象等，支持R81或以上版本。
在此目录下而不是 modules 目录下执行
terraform init 做初始化
terraform apply 做执行
terraform destroy 做删除，删除后如果提示资源锁定，在SmartConsole中MANAGE&SERVICE--Sessions--Viewer Sessions中Publish一下Unamed Session
variables.tf 文件中定义了所要使用的modules名称，激活的modules或同时执行
module.tf 文件中定义了所有在modules中存在的模块，modules 目录下的各目录中的main.tf 文件定义需要创建的network objects / service object / access_rule 等
最后：terraform.tfvars 文件定义目标管理服务器IP地址，用户名，密码


This will create a few network objects and rules within the default Standard policy package via Check Point API available.

This code has been tested with R81 version and above.
