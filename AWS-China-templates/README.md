</style><h1 class="css-245gzq">中国AWS云的CloudGuard CloudFormation集群部署模板</h1></a>&nbsp;</strong></p>
<p>The table below lists CloudFormation templates provided and maintained by Check Point that simplify the deployment of Check Point security solutions in AWS.</p>
<p>You can use these templates as-is or as building blocks for customizing your own templates.</p>
<p><strong>Notes:</strong></p>
<ul>
<li>
<p>You must accept the Software Terms of the relevant Check Point Product AMI in the <a href="https://aws.amazon.com/marketplace/">AWS Marketplace</a> at least once prior to launching the CloudFormation templates. It is not required to actually launch the instance from the Marketplace, but the agreement must be accepted from this location.</p>
</li>
<li>
<p>For R81.20 and higher versions, Gateway Load Balancer (GWLB) and Gateway images are unified. They use <strong>the same</strong> Product AMI in the AWS Marketplace.</p>
</li>
<li>Some stacks may "roll back" automatically after 1 hour, with an error "<em>WaitCondition timed out</em>". If this happens, please check Internet access is working, either through AWS (Internet Gateway (IGW) assigned to the VPC, routetables with a default route and assigned to the relevant subnet(s), and Elastic IP (EIP) assigned, etc), or through another method like external proxy, or route to on-prem, for example.&nbsp;<br><br>&nbsp;</li>
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
<h3 id="Auto Scaling Group"><br>Security Gateways Auto Scaling Group for Gateway Load Balancer (GWLB)</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td style="vertical-align: top; width: 35%;" rowspan="2">Deploys and configures an AWS Auto Scaling group configured for Gateway Load Balancer in a Centralized Security VPC.<br><br>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_Network_for_AWS_Centralized_Gateway_Load_Balancer/Default.htm">CloudGuard Network for AWS Centralized Gateway Load Balancer R80.40 Deployment Guide</a></td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys into it a Gateway Load Balancer, Check Point CloudGuard IaaS Security Gateway Auto Scaling Group, and optionally a Security Management Server.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20<br>R80.40</td>
<td style="text-align: center; width: 10%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/gwlb-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gwlb/gwlb-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gwlb/gwlb-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" width="144" height="27"></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Gateway Load Balancer, Check Point CloudGuard IaaS Security Gateway Auto Scaling Group, and optionally a Security Management Server into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 10%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/gwlb" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gwlb/gwlb.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gwlb/gwlb.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" width="144" height="27"></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 35%;" rowspan="2">Deploys and configures an AWS Auto Scaling group configured for Gateway Load Balancer in a Centralized Security VPC for Transit Gateway.<br><br>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_Network_for_AWS_Gateway_Load_Balancer_Security_VPC_for_Transit_Gateway/Default.htm">CloudGuard Network for AWS Gateway Load Balancer Security VPC for Transit Gateway R80.40 Deployment Guide</a></td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys into it a Gateway Load Balancer, Check Point CloudGuard IaaS Security Gateway Auto Scaling Group, and optionally a Security Management Server, Gateway Load Balancer Endpoints and NAT Gateways for each AZ, for Transit Gateway.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20<br>R80.40</td>
<td style="text-align: center; width: 10%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-gwlb-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gwlb/tgw-gwlb-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gwlb/tgw-gwlb-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" width="144" height="27"></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Gateway Load Balancer, Check Point CloudGuard IaaS Security Gateway Auto Scaling Group, and optionally a Security Management Server, Gateway Load Balancer Endpoints and NAT Gateways for each AZ, for Transit Gateway into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 10%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-gwlb" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gwlb/tgw-gwlb.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" width="16" height="16"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gwlb/tgw-gwlb.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt="" width="144" height="27"></a></td>
</tr>
</tbody>
</table></div>
<h3 id="Security Gateway"><br><br>Security Gateway</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td rowspan="2" style="width: 35%;">Deploys and configures a Security Gateway.<br><br>To deploy the Security Gateway so that it will be automatically provisioned, refer to <a href="https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk131434" target="_blank" rel="noopener">sk131434</a>.</td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys a Security Gateway into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20<br>R81.10<br>R81<br>R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/gateway-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gateway/gateway-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gateway/gateway-master.yaml&amp;stackName=Check-Point-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Security Gateway into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gateway/gateway.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gateway/gateway.yaml&amp;stackName=Check-Point-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p>&nbsp;</p>
<h3 id="Security Cluster">Single Availability Zone Cluster</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td rowspan="2" style="width: 35%;">Deploys and configures two Security Gateways as a Cluster.<br><br>For more details, refer to the <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CloudGuard_Network_for_AWS_Cluster_DeploymentGuide/Default.htm" target="_blank" rel="noopener">CloudGuard Network for AWS Security Cluster R80.20 and Higher Deployment Guide</a>.</td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys a Cluster into it.</td>
<td style="text-align: center;" rowspan="2">R81.20<br>R81.10<br>R81<br>R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cluster-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/cluster-master.yaml&amp;stackName=Check-Point-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Cluster into an <strong>existing VPC</strong>.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/cluster.yaml&amp;stackName=Check-Point-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p>&nbsp;</p>
<h3 id="Security Gateway Auto Scaling">Security Gateways Auto Scaling Group</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td style="width: 35%;">Deploys and configures the Security Gateways as an AWS Auto Scaling group.<br><br>For more details, refer to the <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CloudGuard_Network_for_AWS_AutoScaling_DeploymentGuide/Default.htm" target="_blank" rel="noopener">CloudGuard Network Auto Scaling for AWS R80.20 and Higher Deployment Guide.</a></td>
<td style="width: 25%;">Deploys an Auto Scaling group of Security Gateways into an <strong>existing VPC</strong>.</td>
<td style="width: 6%; text-align: center;">R81.20<br>R81.10<br>R81<br>R80.40</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/autoscale" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/autoscale/autoscale.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/autoscale/autoscale.yaml&amp;stackName=Check-Point-Security-Gateway-AutoScaling" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p>&nbsp;</p>
<h3 id="Transit Gateway Auto Scaling Group">Security Gateways Auto Scaling Group for Transit Gateway</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td rowspan="2" style="width: 35%;">Deploys and configured the Security Gateways as an AWS Auto Scaling group configured for Transit Gateway.<br><br>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_AWS_Transit_Gateway/Default.htm" target="_blank" rel="noopener">AWS Transit Gateway R80.10 and above Deployment Guide</a>.</td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys an Auto Scaling group of Security Gateways configured for Transit Gateway into it, and an optional, preconfigured Security Management Server to manage them.</td>
<td style="width: 6%; text-align: center;" rowspan="2">R81.20<br>R81.10<br>R81<br>R80.40</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-asg-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/autoscale/tgw-asg-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/autoscale/tgw-asg-master.yaml&amp;stackName=Check-Point-TGW-AutoScaling" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys an Auto Scaling group of Security Gateways configured for Transit Gateway into an <strong>existing VPC</strong>, and an optional, preconfigured Security Management Server to manage them.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-asg" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/autoscale/tgw-asg.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/autoscale/tgw-asg.yaml&amp;stackName=Check-Point-TGW-AutoScaling" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p></p>
<h3 id="Cross Availability Zone Cluster"><br>Cross Availability Zone Cluster</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<p>Deploys two Security Gateways, each in a different Availability Zone.<br><br>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_for_AWS_Cross_AZ_Cluster/Default.htm" target="_blank" rel="noopener">Cross Availability Zone Cluster for AWS R81.20 Administration Guide</a></p>
</td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys a Cross Availability Zone Cluster of Security Gateways into it.</td>
<td style="width: 6%; text-align: center;" rowspan="2">R81.20</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cross-az-cluster-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/cross-az-cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/cross-az-cluster-master.yaml&amp;stackName=Check-Point-XAZ-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways into an <strong>existing VPC</strong>.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cross-az-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cross-az-cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/cross-az-cluster.yaml&amp;stackName=Check-Point-XAZ-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 35%;" rowspan="2">
<p>Deploys two Security Gateways, each in a different Availability Zone.<br><br>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_for_AWS_Transit_Gateway_High_Availability/Default.htm">CloudGuard Transit Gateway High Availability for AWS R80.40 Administration Guide</a></p>
</td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys a Cross Availability Zone Cluster of Security Gateways into it.</td>
<td style="width: 6%; text-align: center;" rowspan="2">R81.10<br>R81<br>R80.40</td>
<td style="width: 6%; text-align: center;" rowspan="2"></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/geo-cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/geo-cluster-master.yaml&amp;stackName=Check-Point-geo-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/geo-cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/geo-cluster.yaml&amp;stackName=Check-Point-geo-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p></p>
<h3 id="Transit Gateway Cross Availability Zone Cluster"><br>Cross Availability Zone Cluster for Transit Gateway</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-cross-az-cluster-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/tgw-cross-az-cluster-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/tgw-cross-az-cluster-master.yaml&amp;stackName=Check-Point-TGW-XAZ-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into an <strong>existing VPC</strong>.</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/tgw-cross-az-cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/tgw-cross-az-cluster.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/tgw-cross-az-cluster.yaml&amp;stackName=Check-Point-TGW-XAZ-Cluster" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td rowspan="2" style="width: 35%;">
<p>Deploys two Security Gateways, each in a different Availability Zone, configured for Transit Gateway.</p>
<p>For more details, refer to <a href="https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_CloudGuard_for_AWS_Transit_Gateway_High_Availability/Default.htm">CloudGuard Transit Gateway High Availability for AWS R80.40 Administration Guide</a></p>
</td>
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.10<br>R81<br>R80.40</td>
<td style="text-align: center; width: 6%;" rowspan="2"></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/tgw-ha-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/tgw-ha-master.yaml&amp;stackName=Check-Point-TGW-HA" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Cross Availability Zone Cluster of Security Gateways configured for Transit Gateway into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/cluster/tgw-ha.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/cluster/tgw-ha.yaml&amp;stackName=Check-Point-TGW-HA" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p></p>
<h3 id="Security Management Server"><br>Security Management Server</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td style="width: 35%;">Deploys and configures a Security Management Server.<br><br>For more details, refer to <a href="https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk130372" target="_blank" rel="noopener">sk130372</a>.</td>
<td style="width: 25%;">Deploys a Security Management Server into an <strong>existing VPC</strong>.</td>
<td style="width: 6%; text-align: center;">R81.20<br>R81.10<br>R81<br>R80.40</td>
<td style="width: 6%; text-align: center;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/management" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/management/management.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/management/management.yaml&amp;stackName=Check-Point-Management" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p>&nbsp;</p>
<h3 id="Multi-Domain Management Server">Multi-Domain Management Server</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td style="width: 25%;">Deploys a Multi-Domain Security Management Server into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 6%;">R81.20<br>R81.10<br>R81<br>R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/mds" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/management/mds.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/management/mds.yaml&amp;stackName=Check-Point-MDS" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p></p>
<h3 id="Standalone Deployment"><br>Security Management Server &amp; Security Gateway (Standalone Deployment)</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
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
<td style="width: 25%;">Creates a <strong>new VPC</strong> and deploys a Standalone or a manually configurable instance into it.</td>
<td style="text-align: center; width: 6%;" rowspan="2">R81.20<br>R81.10<br>R81<br>R80.40</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/standalone-master" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gateway/standalone-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gateway/standalone-master.yaml&amp;stackName=Check-Point-Standalone" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 25%;">Deploys a Standalone or a manually configurable instance into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 6%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/standalone" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 10%;"><a href="https://cgi-cfts.s3.amazonaws.com/gateway/standalone.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 18%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/gateway/standalone.yaml&amp;stackName=Check-Point-Standalone" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p></p>
<h3 id="CloudGuard Infinity Next Gateway"><br>CloudGuard AppSec</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 25.0235%;" width="N">Description</td>
<td style="width: 28.3824%;">Notes</td>
<td style="width: 11.5422%;" width="75">CloudFormation Template&nbsp; Download</td>
<td style="width: 22.9196%;" width="160">Direct Launch</td>
</tr>
<tr>
<td style="vertical-align: top; width: 25.0235%;" rowspan="2">Deploys and configures a CloudGuard Infinity Next Gateway</td>
<td style="vertical-align: top; width: 28.3824%;">Creates a <strong>new VPC</strong> and deploys a CloudGuard Infinity Next Gateway into it.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://cgi-cfts.s3.amazonaws.com/waap/waap-gateway-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/waap/waap-gateway-master.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 28.3824%;">Deploys a CloudGuard Infinity Next Gateway into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://cgi-cfts.s3.amazonaws.com/waap/waap-gateway.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/waap/waap-gateway.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<h3 id="CloudGuard Infinity Next Gateway Auto Scaling Group"><br>CloudGuard AppSec Auto Scaling Group</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed; width: 100%;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 25.0235%;" width="N">Description</td>
<td style="width: 28.3824%;">Notes</td>
<td style="width: 11.5422%;" width="75">CloudFormation Template&nbsp; Download</td>
<td style="width: 22.9196%;" width="160">Direct Launch</td>
</tr>
<tr>
<td style="vertical-align: top; width: 25.0235%;" rowspan="2">Deploys and configures a CloudGuard Infinity Next Gateway as an AWS Auto Scaling Group</td>
<td style="vertical-align: top; width: 28.3824%;">Creates a <strong>new VPC </strong>and deploys the Auto Scaling Group into it.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://cgi-cfts.s3.amazonaws.com/waap/waap-autoscale-master.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/quickcreate?templateURL=https://cgi-cfts.s3.amazonaws.com/waap/waap-autoscale-master.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway-Asg" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="vertical-align: top; width: 28.3824%;">Deploys the Auto Scaling Group into an <strong>existing VPC</strong>.</td>
<td style="text-align: center; width: 11.5422%;"><a href="https://cgi-cfts.s3.amazonaws.com/waap/waap-autoscale.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 22.9196%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/quickcreate?templateURL=https://cgi-cfts.s3.amazonaws.com/waap/waap-autoscale.yaml&amp;stackName=Check-Point-Infinity-Next-Gateway-Asg" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<h3 id="General"><br>General</h3>
<div class="table-wrapper"><table class="footnote" style="table-layout: fixed;" width="100%" cellspacing="2" cellpadding="4" border="1">
<tbody>
<tr class="SubTitle" style="text-align: center;" bgcolor="#d6dff0">
<td style="width: 50.0317%;" width="N">Description</td>
<td style="width: 20.43697%;" width="75">CloudFormation Template&nbsp; Download</td>
<td style="width: 17%;">Terraform Template</td>
<td style="width: 23.0752%;" width="160">Direct Launch</td>
</tr>
<tr>
<td style="vertical-align: top; width: 60.0317%;"><strong>Create an Instance profile for Security Management Server</strong><br>
<p>Creates an Instance profile in your account preconfigured with permissions to manage resources.</p>
<p>For more details, refer to <a href="https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk122074" target="_blank" rel="noopener">sk122074</a>.</p>
</td>
<td style="text-align: center; width: 7.43697%;"><a href="https://cgi-cfts.s3.amazonaws.com/iam/cme-iam-role.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 3.31933%;"><a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/terraform/aws/cme-iam-role" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" style="display: block; margin-left: auto; margin-right: auto;" border="0"></a></td>
<td style="text-align: center; width: 23.0752%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/iam/cme-iam-role.yaml&amp;stackName=Check-Point-IAM-Role" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
<tr>
<td style="width: 60.0317%;"><span><strong>Current Check Point AMIs</strong></span>
<p>A helper template that returns the latest Check Point AMIs in a given region.</p>
</td>
<td style="text-align: center; width: 7.43697%;"><a href="https://cgi-cfts.s3.amazonaws.com/utils/amis.yaml" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/images/download-m.png" alt="" border="0"></a></td>
<td style="text-align: center; width: 3.31933%;"></td>
<td style="text-align: center; width: 23.0752%;"><a href="https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://cgi-cfts.s3.amazonaws.com/utils/amis.yaml&amp;stackName=Check-Point-AMIs" target="_blank" rel="noopener"><img src="https://sc1.checkpoint.com/sc/SolutionsStatics/NEW_SK_NOID1460631718185/launch1604140412.png" alt=""></a></td>
</tr>
</tbody>
</table></div>
<p>CloudFormation templates for previous versions can be found in the <a href="https://github.com/CheckPointSW/CloudGuardIaaS/tree/master/deprecated/aws/templates" target="_blank" rel="noopener">CloudGuard Network Security GitHub repository</a>.</p>
<p><strong>Notes:</strong></p>
<ul>
<li>CloudFormation Templates are often called CFT by customers and partners.<br><br></li>
<li>Check Point Recommended version for all deployments is <a href="https://supportcenter.checkpoint.com/supportcenter/portal?eventSubmit_doGoviewsolutiondetails=&amp;solutionid=sk170416#Installation" target="_blank" rel="noopener">R81.10 Take 335</a> with its Recommended <a href="https://sc1.checkpoint.com/documents/Jumbo_HFA/R81.10/Default.htm" target="_blank" rel="noopener">Jumbo Hotfix Accumulator</a> Take. R81.10 is initially recommended for customers who are interested in implementing the new features described at the formal announcement.</li>
</ul></div></div><div name="properties" id="properties"><div class="css-1mb2pxv"><h2 class="css-kiamhx">Article Properties</h2><div class="css-1nqr0h"><div id="Access Level" class="css-15c0699"><span class="css-1qw5p6u">Access Level</span><span class="css-10f7xsz">General</span></div><div id="Date Created" class="css-15c0699"><span class="css-1qw5p6u">Date Created</span><span class="css-10f7xsz">2016-04-14</span></div><div id="Last Modified" class="css-15c0699"><span class="css-1qw5p6u">Last Modified</span><span class="css-10f7xsz">2023-05-29</span></div></div></div></div></div></div></div></div><div name="feedback" id="feedback"><div class="css-lw67gk"><div class="css-9hnqa8"><span class="css-1o4ethg"><svg id="Group_196014" data-name="Group 196014" xmlns="http://www.w3.org/2000/svg" width="23.077" height="24" viewBox="0 0 23.077 24"><defs><clipPath id="clip-path"><rect id="Rectangle_82702" data-name="Rectangle 82702" width="23.077" height="24" fill="#666"></rect></clipPath></defs><g id="Group_196014-2" data-name="Group 196014" clip-path="url(#clip-path)"><path id="Path_89863" data-name="Path 89863" d="M22.97,22.56l-1.948-4.409A11.573,11.573,0,0,0,11.588,0a11.588,11.588,0,0,0,0,23.175,11.522,11.522,0,0,0,5.64-1.436l4.409,2.153a.961.961,0,0,0,1.128-.205.936.936,0,0,0,.205-1.128m-9.642-8.048a4.638,4.638,0,1,1-1.221-6.445l-.034.034a1.693,1.693,0,0,0,.034,2.394l-1.361,1.8a1.145,1.145,0,0,0-1.256.141l-1.112-.836.341-.454L7.462,10.2l-.947,1.258,1.258.947.341-.454,1.1.828a1.142,1.142,0,0,0-.074.178c0,.014-.009.028-.013.042a1.125,1.125,0,0,0-.037.179.156.156,0,0,0,0,.032,1.146,1.146,0,0,0,0,.155.328.328,0,0,1,0,.047,1.179,1.179,0,0,0,.028.169c0,.017.01.033.014.05a1.164,1.164,0,0,0,.047.133c.006.014.011.028.017.042a1.133,1.133,0,0,0,.089.154c.011.016.024.032.037.048a1.142,1.142,0,0,0,.09.1c.015.014.028.029.043.042a1.142,1.142,0,0,0,1.641-1.584l1.365-1.813a1.7,1.7,0,0,0,1.551.064h0a4.638,4.638,0,0,1-.679,3.687m3.024-6.4a1.737,1.737,0,1,1-.266-2.442h0a1.737,1.737,0,0,1,.265,2.441" fill="#666"></path></g></svg>Share your feedback</span></div><div><form></form></div></div></div></div><div class="css-mf96eq"><div class="css-w2zmsj"><h4 class="css-ydh9w4">Haven't found what you're looking for?</h4><h5 class="css-4dzu8t">Our customer support team is only a click away and ready to help you 24 hours a day.</h5><a href="https://help.checkpoint.com/s/create-new-sr" target="_blank"><button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeSmall MuiButton-containedSizeSmall css-1hhm4og" tabindex="0" type="button" id="openServiceRequestButton">Open a Service Request<span class="MuiTouchRipple-root css-w0pj6f"></span></button></a></div></div></div></div><footer class="sc-jSUZER egeJKp poncho-footer"><hr><div class="poncho-footer-content"><div class="sc-dkrFOg fDUDkd"><span class="title">Follow Us</span><a href="https://www.facebook.com/checkpointsoftware" class="sc-bcXHqe sc-gswNZR hOuhoX bbLVwL"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M400 32H48A48 48 0 0 0 0 80v352a48 48 0 0 0 48 48h137.25V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.27c-30.81 0-40.42 19.12-40.42 38.73V256h68.78l-11 71.69h-57.78V480H400a48 48 0 0 0 48-48V80a48 48 0 0 0-48-48z"></path></svg></a><a href="https://twitter.com/checkpointsw" class="sc-bcXHqe sc-gswNZR hOuhoX bbLVwL"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M400 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-48.9 158.8c.2 2.8.2 5.7.2 8.5 0 86.7-66 186.6-186.6 186.6-37.2 0-71.7-10.8-100.7-29.4 5.3.6 10.4.8 15.8.8 30.7 0 58.9-10.4 81.4-28-28.8-.6-53-19.5-61.3-45.5 10.1 1.5 19.2 1.5 29.6-1.2-30-6.1-52.5-32.5-52.5-64.4v-.8c8.7 4.9 18.9 7.9 29.6 8.3a65.447 65.447 0 0 1-29.2-54.6c0-12.2 3.2-23.4 8.9-33.1 32.3 39.8 80.8 65.8 135.2 68.6-9.3-44.5 24-80.6 64-80.6 18.9 0 35.9 7.9 47.9 20.7 14.8-2.8 29-8.3 41.6-15.8-4.9 15.2-15.2 28-28.8 36.1 13.2-1.4 26-5.1 37.8-10.2-8.9 13.1-20.1 24.7-32.9 34z"></path></svg></a><a href="https://www.linkedin.com/company/check-point-software-technologies" class="sc-bcXHqe sc-gswNZR hOuhoX bbLVwL"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z"></path></svg></a><a href="https://www.youtube.com/user/CPGlobal" class="sc-bcXHqe sc-gswNZR hOuhoX bbLVwL"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 576 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z"></path></svg></a></div><div class="sc-hLBbgP lgQvcx">YOU DESERVE THE BEST SECURITY<small>™</small></div><div class="sc-eDvSVe eonbVm"><div>©1994-<!-- -->2023<!-- --> Check Point Software Technologies Ltd. All rights reserved.</div><div><a href="https://www.checkpoint.com/copyright/" target="_blank" class="sc-bcXHqe hOuhoX">Copyright</a>&nbsp;|&nbsp;<a href="https://www.checkpoint.com/privacy/" target="_blank" class="sc-bcXHqe hOuhoX">Privacy Policy</a></div></div></div></footer></div>