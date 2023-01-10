|cp -r ./cluster/.terraform ./cluster-addon
yes|cp ./cluster/.terraform.lock.hcl ./cluster-addon
yes|cp -r ./cluster/.terraform ./cluster-master
yes|cp ./cluster/.terraform.lock.hcl ./cluster-master
yes|cp -r ./cluster/.terraform ./gateway
yes|cp ./cluster/.terraform.lock.hcl ./gateway
yes|cp -r ./cluster/.terraform ./gateway-master
yes|cp ./cluster/.terraform.lock.hcl ./gateway-master
yes|cp -r ./cluster/.terraform ./management
yes|cp ./cluster/.terraform.lock.hcl ./management
yes|cp -r ./cluster/.terraform ./management-master
yes|cp ./cluster/.terraform.lock.hcl ./management-master
echo all done
