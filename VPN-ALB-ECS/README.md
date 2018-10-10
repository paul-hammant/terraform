#Terraform Directiory Resource Creation 
- Create a VPC, Private and Public Subnet.
- Create ALB and Listener on 80. 
- Create ECR, ECS Cluster and AutoScaling Group attached.

Note: Please go through the variable.tf of each module.


#Terraform  Steps
Step1: Initialize the terraform directory 
$terraform init
Step2: Check the action Plan or dry run
$terraform plan 
Step3: Apply the changes
$terraform apply

#Overide Variable
we can also explicitly define a variable
From a file:

File Content of secret.tfvars
keypair = "oregon"
region = "us-west-2"


$terraform apply  -var-file="secret.tfvars"


#Command Line
we can also explicitly define variable
$terraform apply  -var 'keypair=oregon'


#Excution Steps 
create variable.tfvars with all the variable defined in variable.tf file defined in this directory
$terraform plan -var-file="variable.tfvars"
