# Terraform Resource Involved 
- Create a ECS Service
- Create task defination
Note: Please go through the variable.tf of each module.

# Dependency
This ECS-SERVICE dpends upon the ouptput of VPN-ALB-ECS
Note: Pass the required variable from previous terraform directory 
###### check output  
```
terraform output 
```
###### check the output per module.
```
terraform output --module={module_name}
```
for example VPN-ALB-ECS has four module and create_alb is one of them which is defined in main.tf
```
terraform output --module=create_alb
```
# terraform workspace
create terraform  workspace as per environment. Here **qa** and **qa2** are hypthetical lower environment for testing 
```
terraform workspace new qa 
terraform workspace new qa2
```
###### work on a particular environment
```
terraform workspace select qa 
```


# Excution Steps 
Pass required values to env based variable.tfvars(qa-variable.tfvars (say)) with all the variable defined in variable.tf file defined in this directory

**Suppose we are working on qa environment then:**
```
terraform workspace select qa 
terraform plan -var-file="qa-variable.tfvars"
terraform apply -var-file="qa-variable.tfvars"
```
