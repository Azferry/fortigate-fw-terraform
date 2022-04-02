# fortigate-fw-terraform

```
export "FORTIOS_ACCESS_HOSTNAME"="192.168.1.1"
export "FORTIOS_INSECURE"="true"
export "FORTIOS_ACCESS_TOKEN"="09m441wrwc10yGyrtQ4nk6mjbqcfz9"
```




ARM_ACCESS_KEY=Ul9QJ1laV/CTCMnddyyu3dqxGiFVEvo42dq5YyxJt8X7kOssvqoWQx2l/1FoSxV9AowxAwwBkV+A0dYOLpFb3w==

terraform init `
  -backend-config="resource_group_name=ntc-prd-wus3-terra-rg01" `
  -backend-config="storage_account_name=npwus3terrasa01" `
  -backend-config="container_name=tf-state-firewall" `
  -backend-config="key=tf_deploy_fortigate.tfstate"