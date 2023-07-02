# China Azure Resource Manager templates
# 中国 Azure ARM 部署模板
This directory contains the CloudGuard IaaS solution templates published in the [China Azure Marketplace](https://market.azure.cn/marketplace/apps/sinoage.checkpoint--cloudguard-iaas?tab=Overview).

该目录包含在[中国Azure市场](https://market.azure.cn/marketplace/apps/sinoage.checkpoint--cloudguard-iaas?tab=Overview)发布的CloudGuard IaaS解决方案模板。其中gateway-load-balancer，ha，management，mds，single，vmss都可正常使用

# How to deploy templates manually
# 如何手动部署模板
To deploy the ARM templates manually without using the Azure Marketplace, follow these instructions:
要在不使用 Azure 市场的情况下手动部署 ARM 模板，请按照以下说明操作：
1. Log in to the [Microsoft China Azure Portal](https://portal.azure.cn)
   <p>登录[微软中国Azure门户](https://portal.azure.cn)</p>
2. Click "*Create a resource*"
   <p>点击“*创建资源*”</p>
3. Search for "*Template deployment (deploy using custom templates)*" and click "*Create*"
   <p>搜索“*模板部署（使用自定义模板部署）*”，点击“*创建*”</p>
4. Click "*Build your own template in the editor*"
   <p>点击“*在编辑器中生成自己的模板*”</p>
5. Load the "*mainTemplate.json*" file of the desired template and click "*Save*"
   <p>点击“*加载文件*”加载所需模板的“*mainTemplate.json*”文件，然后点击“*保存*”</p>
6. Enter the desired template parameters
   <p>选择资源组，输入所需的模板参数，当验证方式为password 时 Admin Password为必填项，Sic Key也为必填项</p>
   - Replace the "*_artifacts Location*" property with:
      ```
      https://azure.s3.cn-northwest-1.amazonaws.com.cn/
      ```
7. Click *Purchase* to deploy the solution
   <p>单击*购买*以部署解决方案</p>