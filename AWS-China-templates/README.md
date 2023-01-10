## AWS China CloudFormation Templates

<p><strong>Notes:</strong></p>
<ul>
<li>
<p>You must accept the Software Terms of the relevant Check Point Product AMI in the <a href="https://aws.amazon.com/marketplace/">AWS Marketplace</a> at least once prior to launching the CloudFormation templates. It is not required to actually launch the instance from the Marketplace, but the agreement must be accepted from this location.</p>
</li>
<li>
<p>For R81.20 and higher versions, Gateway Load Balancer (GWLB) and Gateway images are unified. They use <strong>the same</strong> Product AMI in the AWS Marketplace.</p>
</li>
<li>Some stacks may "roll back" automatically after 1 hour, with an error "<em>WaitCondition timed out</em>". If this happens, please check Internet access is working, either through AWS (Internet Gateway (IGW) assigned to the VPC, routetables with a default route and assigned to the relevant subnet(s), and Elastic IP (EIP) assigned, etc), or through another method like external proxy, or route to on-prem, for example.&nbsp;<br /><br />&nbsp;</li>
</ul>
<p><strong>Table of Contents</strong></p>
<!-- TOC-start -->
<ul type="disc">
<li>
<div class="checkpoint_navigate" targetid="Auto Scaling Group">Security Gateways Auto Scaling Group for Gateway Load Balancer (GWLB)</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Security Gateway">Security Gateway</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Security Cluster">Single Availability Zone Cluster</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Security Gateway Auto Scaling">Security Gateways Auto Scaling Group</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Transit Gateway Auto Scaling Group">Security Gateways Auto Scaling Group for Transit Gateway</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Cross Availability Zone Cluster">Cross Availability Zone Cluster</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Transit Gateway Cross Availability Zone Cluster">Cross Availability Zone Cluster for Transit Gateway</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Security Management Server">Security Management Server</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Multi-Domain Management Server">Multi-Domain Management Server</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="Standalone Deployment">Security Management Server &amp; Security Gateway (Standalone Deployment)</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="CloudGuard Infinity Next Gateway">CloudGuard AppSec&nbsp;</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="CloudGuard Infinity Next Gateway Auto Scaling Group">CloudGuard AppSec Auto Scaling Group</div>
</li>
<li>
<div class="checkpoint_navigate" targetid="General">General</div>
</li>
</ul>
<!-- TOC-end -->
<h3 id="Auto Scaling Group">Security Gateways Auto Scaling Group for Gateway Load Balancer (GWLB)</h3>
<table class="footnote" style="table-layout: fixed;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 12%;">Version</td>
<td style="width: 10%;">CloudFormation Templat Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td style="vertical-align: top;">Deploys and configures an AWS Auto Scaling group configured for Gateway Load Balancer in a Centralized Security VPC.<br /><br />For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_Network_for_AWS_Centralized_Gateway_Load_Balancer/Default.htm">CloudGuard Network for AWS Centralized Gateway Load Balancer R80.40 Deployment Guide</a></td>
<td>Creates a new VPC and deploys into it a Gateway Load Balancer, Check Point CloudGuard IaaS Security Gateway Auto Scaling Group, and optionally a Security Management Server.</td>
<td style="text-align: center;">R81.20<br />R80.40</td>
<td style="text-align: center;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gwlb/gwlb-master.yaml"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gwlb/gwlb-master.yaml"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" width="144" height="27" /></a></td>
</tr>
<tr>
<td style="vertical-align: top;">Deploys and configures an AWS Auto Scaling group configured for Gateway Load Balancer in a Centralized Security VPC for Transit Gateway.<br /><br />For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_Network_for_AWS_Gateway_Load_Balancer_Security_VPC_for_Transit_Gateway/Default.htm">CloudGuard Network for AWS Gateway Load Balancer Security VPC for Transit Gateway R80.40 Deployment Guide</a></td>
<td>Creates a new VPC and deploys into it a Gateway Load Balancer, Check Point CloudGuard IaaS Security Gateway Auto Scaling Group, and optionally a Security Management Server, Gateway Load Balancer Endpoints and NAT Gateways for each AZ, for Transit Gateway.</td>
<td style="text-align: center;">R81.20<br />R80.40</td>
<td style="text-align: center;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gwlb/tgw-gwlb-master.yaml"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gwlb/tgw-gwlb-master.yaml"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" width="144" height="27" /></a></td>
</tr>
</tbody>
</table>
<h3 id="Security Gateway"><br /><br />Security Gateway</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td rowspan="2" style="width: 35%;">Deploys and configures a Security Gateway.<br /><br />To deploy the Security Gateway so that it will be automatically provisioned, refer to <a href="https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk131434" target="_blank" rel="noopener">sk131434</a>.</td>
<td style="width: 25%;">Creates a new VPC and deploys a Security Gateway into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20<br />R81.10<br />R81<br />R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/gateway-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/gateway-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/gateway-master.yaml&amp;stackName=Check-Point-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Security Gateway into an existing VPC.</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/gateway.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/gateway.yaml&amp;stackName=Check-Point-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<h3 id="Security Cluster">Single Availability Zone Cluster</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template&nbsp; Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td rowspan="2" style="width: 35%;">Deploys and configures two Security Gateways as a Cluster.<br /><br />For more details, refer to the <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CloudGuard_Network_for_AWS_Cluster_DeploymentGuide/Default.htm" target="_blank" rel="noopener">CloudGuard Network for AWS Security Cluster R80.20 and Higher Deployment Guide</a>.</td>
<td style="width: 25%;">Creates a new VPC and deploys a Cluster into it.</td>
<td style="text-align: center;" rowspan="2">R81.20<br />R81.10<br />R81<br />R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cluster-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/cluster-master.yaml&amp;stackName=Check-Point-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Cluster into an existing VPC.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/cluster.yaml&amp;stackName=Check-Point-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<h3 id="Security Gateway Auto Scaling">Security Gateways Auto Scaling Group</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td style="width: 35%;">Deploys and configures the Security Gateways as an AWS Auto Scaling group.<br /><br />For more details, refer to the <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CloudGuard_Network_for_AWS_AutoScaling_DeploymentGuide/Default.htm" target="_blank" rel="noopener">CloudGuard Network Auto Scaling for AWS R80.20 and Higher Deployment Guide.</a></td>
<td style="width: 25%;">Deploys an Auto Scaling group of Security Gateways into an existing VPC.</td>
<td style="width: 6%; text-align: center;">R81.20<br />R81.10<br />R81<br />R80.40</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/autoscale"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/autoscale/autoscale.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/autoscale/autoscale.yaml&amp;stackName=Check-Point-Security-Gateway-AutoScaling" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<h3 id="Transit Gateway Auto Scaling Group">Security Gateways Auto Scaling Group for Transit Gateway</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td rowspan="2" style="width: 35%;">Deploys and configured the Security Gateways as an AWS Auto Scaling group configured for Transit Gateway.<br /><br />For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_AWS_Transit_Gateway/Default.htm" target="_blank" rel="noopener">AWS Transit Gateway R80.10 and above Deployment Guide</a>.</td>
<td style="width: 25%;">Creates a new VPC and deploys an Auto Scaling group of Security Gateways configured for Transit Gateway into it, and an optional, preconfigured Security Management Server to manage them.</td>
<td style="width: 6%; text-align: center;" rowspan="2">R81.20<br />R81.10<br />R81<br />R80.40</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-asg-master"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/autoscale/tgw-asg-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/autoscale/tgw-asg-master.yaml&amp;stackName=Check-Point-TGW-AutoScaling" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys an Auto Scaling group of Security Gateways configured for Transit Gateway into an existing VPC, and an optional, preconfigured Security Management Server to manage them.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-asg" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/autoscale/tgw-asg.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/autoscale/tgw-asg.yaml&amp;stackName=Check-Point-TGW-AutoScaling" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p></p>
<h3 id="Cross Availability Zone Cluster"><br />Cross Availability Zone Cluster</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td style="width: 35%;" rowspan="2">
<p>Deploys two Security Gateways, each in a different Availability Zone.<br /><br />For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_for_AWS_Cross_AZ_Cluster/Default.htm" target="_blank" rel="noopener">Cross Availability Zone Cluster for AWS R81.20 Administration Guide</a></p>
</td>
<td style="width: 25%;">Creates a new VPC and deploys a Cross Availability Zone Cluster of Security Gateways into it.</td>
<td style="width: 6%; text-align: center;" rowspan="2">R81.20</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cross-az-cluster-master"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/cross-az-cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/cross-az-cluster-master.yaml&amp;stackName=Check-Point-XAZ-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways into an existing VPC.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cross-az-cluster"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cross-az-cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/cross-az-cluster.yaml&amp;stackName=Check-Point-XAZ-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 35%;" rowspan="2">
<p>Deploys two Security Gateways, each in a different Availability Zone.<br /><br />For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_for_AWS_Transit_Gateway_High_Availability/Default.htm">CloudGuard Transit Gateway High Availability for AWS R80.40 Administration Guide</a></p>
</td>
<td style="width: 25%;">Creates a new VPC and deploys a Cross Availability Zone Cluster of Security Gateways into it.</td>
<td style="width: 6%; text-align: center;" rowspan="2">R81.10<br />R81<br />R80.40</td>
<td style="width: 6%; text-align: center;" rowspan="2"></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/geo-cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/geo-cluster-master.yaml&amp;stackName=Check-Point-geo-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways into an existing VPC.</td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/geo-cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/geo-cluster.yaml&amp;stackName=Check-Point-geo-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p></p>
<h3 id="Transit Gateway Cross Availability Zone Cluster"><br />Cross Availability Zone Cluster for Transit Gateway</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td rowspan="2" style="width: 35%;">
<p>Deploys two Security Gateways, each in a different Availability Zone, configured for Transit Gateway.</p>
<p>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_for_AWS_Cross_AZ_Cluster/Default.htm" target="_blank" rel="noopener">Cross Availability Zone Cluster for AWS R81.20 Administration Guide</a></p>
</td>
<td style="width: 25%;">Creates a new VPC and deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-cross-az-cluster-master"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-cross-az-cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-cross-az-cluster-master.yaml&amp;stackName=Check-Point-TGW-XAZ-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into an existing VPC.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-cross-az-cluster"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-cross-az-cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-cross-az-cluster.yaml&amp;stackName=Check-Point-TGW-XAZ-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td rowspan="2" style="width: 35%;">
<p>Deploys two Security Gateways, each in a different Availability Zone, configured for Transit Gateway.</p>
<p>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_for_AWS_Transit_Gateway_High_Availability/Default.htm">CloudGuard Transit Gateway High Availability for AWS R80.40 Administration Guide</a></p>
</td>
<td style="width: 25%;">Creates a new VPC and deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.10<br />R81<br />R80.40</td>
<td style="text-align: center; width: 6%;" rowspan="2"></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-ha-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-ha-master.yaml&amp;stackName=Check-Point-TGW-HA" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into an existing VPC.</td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-ha.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/cluster/tgw-ha.yaml&amp;stackName=Check-Point-TGW-HA" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p></p>
<h3 id="Security Management Server"><br />Security Management Server</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template&nbsp; Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td style="width: 35%;">Deploys and configures a Security Management Server.<br /><br />For more details, refer to <a href="https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk130372" target="_blank" rel="noopener">sk130372</a>.</td>
<td style="width: 25%;">Deploys a Security Management Server into an existing VPC.</td>
<td style="width: 6%; text-align: center;">R81.20<br />R81.10<br />R81<br />R80.40</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/management" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/management/management.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/management/management.yaml&amp;stackName=Check-Point-Management" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<h3 id="Multi-Domain Management Server">Multi-Domain Management Server</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template&nbsp; Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td style="width: 35%;">Deploys and configures&nbsp;a Multi-Domain Security Management Server.
<p>For more details, refer to <a href="https://supportcenter.us.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk143213" target="_blank" rel="noopener">sk143213</a>.</p>
</td>
<td style="width: 25%;">Deploys a Multi-Domain Security Management Server into an existing VPC.</td>
<td style="text-align: center; width: 6%;">R81.20<br />R81.10<br />R81<br />R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/mds" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/management/mds.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/management/mds.yaml&amp;stackName=Check-Point-MDS" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p></p>
<h3 id="Standalone Deployment"><br />Security Management Server &amp; Security Gateway (Standalone Deployment)</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 35%;">Description</td>
<td style="width: 25%;">Notes</td>
<td style="width: 6%;">Version</td>
<td style="width: 6%;">Terraform Template</td>
<td style="width: 10%;">CloudFormation Template&nbsp; Download</td>
<td style="width: 18%;">Direct Launch</td>
</tr>
<tr>
<td rowspan="2" style="width: 35%;">
<p>Deploys and configures Standalone or a manually configurable instance.</p>
</td>
<td style="width: 25%;">Creates a new VPC and deploys a Standalone or a manually configurable instance into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20<br />R81.10<br />R81<br />R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/standalone-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/standalone-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/standalone-master.yaml&amp;stackName=Check-Point-Standalone" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Standalone or a manually configurable instance into an existing VPC.</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/standalone" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 10%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/standalone.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/gateway/standalone.yaml&amp;stackName=Check-Point-Standalone" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<p></p>
<h3 id="CloudGuard Infinity Next Gateway"><br />CloudGuard AppSec (Not in China AWS)</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 25.0235%;" width="N">Description</td>
<td style="width: 28.3824%;">Notes</td>
<td style="width: 11.5422%;" width="75">CloudFormation Template&nbsp; Download</td>
<td style="width: 22.9196%;" width="160">Direct Launch</td>
</tr>
<tr>
<td style="vertical-align: top; width: 25.0235%;" rowspan="2">Deploys and configures a CloudGuard Infinity Next Gateway</td>
<td style="vertical-align: top; width: 28.3824%;">Creates a new VPC and deploys a CloudGuard Infinity Next Gateway into it.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-gateway-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-gateway-master.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 28.3824%;">Deploys a CloudGuard Infinity Next Gateway into an existing VPC.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-gateway.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-gateway.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<h3 id="CloudGuard Infinity Next Gateway Auto Scaling Group"><br />CloudGuard AppSec Auto Scaling Group (Not in China AWS)</h3>
<table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 25.0235%;" width="N">Description</td>
<td style="width: 28.3824%;">Notes</td>
<td style="width: 11.5422%;" width="75">CloudFormation Template&nbsp; Download</td>
<td style="width: 22.9196%;" width="160">Direct Launch</td>
</tr>
<tr>
<td style="vertical-align: top; width: 25.0235%;" rowspan="2">Deploys and configures a CloudGuard Infinity Next Gateway as an AWS Auto Scaling Group</td>
<td style="vertical-align: top; width: 28.3824%;">Creates a new VPC and deploys the Auto Scaling Group into it.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-autoscale-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/quickcreate?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-autoscale-master.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway-Asg" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 28.3824%;">Deploys the Auto Scaling Group into an existing VPC.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-autoscale.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/quickcreate?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/waap/waap-autoscale.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway-Asg" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
<h3 id="General"><br />General</h3>
<table class="footnote" style="table-layout: fixed;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 50.0317%;" width="N">Description</td>
<td style="width: 20.43697%;" width="75">CloudFormation Template&nbsp; Download</td>
<td style="width: 17%;">Terraform Template</td>
<td style="width: 23.0752%;" width="160">Direct Launch</td>
</tr>
<tr>
<td style="vertical-align: top; width: 60.0317%;"><strong>Create a IAM Role for Security Management Server</strong><br />
<p>Creates a IAM role in your account preconfigured with permissions to manage resources.</p>
<p>For more details, refer to <a href="https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk122074" target="_blank" rel="noopener">sk122074</a>.</p>
</td>
<td style="text-align: center; width: 7.43697%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/iam/cme-iam-role.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 3.31933%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cme-iam-role" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0" /></a></td>
<td style="text-align: center; width: 23.0752%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/iam/cme-iam-role.yaml&amp;stackName=Check-Point-IAM-Role" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
<tr>
<td style="width: 60.0317%;"><span><strong>Current Check Point AMIs</strong></span>
<p>A helper template that returns the latest Check Point AMIs in a given region.</p>
</td>
<td style="text-align: center; width: 7.43697%;"><a href="https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/utils/amis.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0" /></a></td>
<td style="text-align: center; width: 3.31933%;"></td>
<td style="text-align: center; width: 23.0752%;"><a href="https://console.amazonaws.cn/cloudformation/home#/stacks/create/review?templateURL=https://raw.githubusercontent.com/gexqin/CloudGuard-China/main/AWS-China-templates/utils/amis.yaml&amp;stackName=Check-Point-AMIs" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" /></a></td>
</tr>
</tbody>
</table>
