# fortigate-fw-terraform

```
export "FORTIOS_ACCESS_HOSTNAME"="192.168.1.1"
export "FORTIOS_INSECURE"="true"
export "FORTIOS_ACCESS_TOKEN"="<token>"
```




ARM_ACCESS_KEY=key
terraform init `
  -backend-config="resource_group_name=ntc-prd-wus3-terra-rg01" `
  -backend-config="storage_account_name=npwus3terrasa01" `
  -backend-config="container_name=tf-state-firewall" `
  -backend-config="key=tf_deploy_fortigate.tfstate"

