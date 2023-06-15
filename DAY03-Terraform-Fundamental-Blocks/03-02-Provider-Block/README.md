# Terraform Provider Block

## Step-01: Introduction
- What are Terraform Providers?
- What Providers Do?
- Where do providers reside (Terraform Registry)?
- How to use Providers?
- What are Provider Badges?


## Step-02: Terraform Providers
- What are Terraform Providers?
- What Providers Do?
- Where do providers reside (Terraform Registry)?


## Step-03: Provider Requirements
- Define required providers in Terraform Block
- Understand about three things about defining `required_providers` in terraform block
  - local names
  - source
  - version

#### Click to see the instructions for respective cloud provider
### [AWS](#aws)
### [AZURE](#azure)

## AWS
```t
# Terraform Block
## AWS
terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = { 
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
```


## Step-04: Provider Block  
- Create a Provider Block for AWS
```t
# Provider Block
provider "aws" {
  region = "us-east-1"
  profile = "default"  # defining it is optional for default profile
}
```
- Discuss about [Authentication Types](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication) 
- Static Credentials - NOT A RECOMMENDED Option
- Environment variables
- Shared credentials/configuration file ( We are going to use this)
  - Verify your `cat $HOME/.aws/credentials`
  - If not, use `aws configure` to configure the aws credentials

```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan
```  

## Step-05: Add a Resource Block to create a AWS VPC
- [AWS VPC Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
```t
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "myvpc"
  }
}
```

## Step-06: Execute Terraform commands to create AWS VPC
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan

# Create Resources using Terraform Apply
terraform apply -auto-approve
```  

## Step-07: Clean-Up 
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

# Delete Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## References
- [Terraform Providers](https://www.terraform.io/docs/configuration/providers.html)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

## AZURE

```t

terraform {
  required_version = "~> 1.3.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }
}
```


## Step-04: Provider Block  
- Create a Provider Block for AWS
```t
# Provider Block
provider "azurerm" {
  features {}
}

```
- Discuss about [Authentication Types](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure) 
- Static Credentials - NOT A RECOMMENDED Option
- Environment variables
- Execute command "az login" and Authenticate

```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan
```  

## Step-05: Add a Resource Block to create a AWS VPC
- [AWS Network Security Group Resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group)
```t
resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = "eastus"
  resource_group_name = "terraform-rg"
}
```

## Step-06: Execute Terraform commands to create AWS VPC
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan

# Create Resources using Terraform Apply
terraform apply -auto-approve
```  

## Step-07: Clean-Up 
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

# Delete Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Create Service Principle for Azure
[**Creating a Service
Principal**](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal)

A Service Principal is an application within Azure Active Directory
whose authentication tokens can be used as the client_id, client_secret,
and tenant_id fields needed by Terraform (subscription_id can be
independently recovered from your Azure account details).

It\'s possible to complete this task in either the [Azure
CLI](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal-using-the-azure-cli) or
in the [Azure
Portal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal-in-the-azure-portal) -
in both we\'ll create a Service Principal which has Contributor rights
to the subscription. [It\'s also possible to assign other
rights](https://docs.microsoft.com/azure/role-based-access-control/built-in-roles) depending
on your configuration.

[**Creating a Service Principal using the Azure
CLI**](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#creating-a-service-principal-using-the-azure-cli)

Firstly, login to the Azure CLI using:

az login

Once logged in - it\'s possible to list the Subscriptions associated
with the account via:

az account list

The output (similar to below) will display one or more Subscriptions -
with the id field being the subscription_id field referenced above.

\[

{

\"cloudName\": \"AzureCloud\",

\"id\": \"00000000-0000-0000-0000-000000000000\",

\"isDefault\": true,

\"name\": \"PAYG Subscription\",

\"state\": \"Enabled\",

\"tenantId\": \"00000000-0000-0000-0000-000000000000\",

\"user\": {

\"name\": \"user@example.com\",

\"type\": \"user\"

}

}

\]

Should you have more than one Subscription, you can specify the
Subscription to use via the following command:

az account set \--subscription=\"SUBSCRIPTION_ID\"

We can now create the Service Principal which will have permissions to
manage resources in the specified Subscription using the following
command:

az ad sp create-for-rbac \--role=\"Contributor\"
\--scopes=\"/subscriptions/SUBSCRIPTION_ID\"

This command will output 5 values:

{

\"appId\": \"00000000-0000-0000-0000-000000000000\",

\"displayName\": \"azure-cli-2017-06-05-10-41-15\",

\"name\": \"http://azure-cli-2017-06-05-10-41-15\",

\"password\": \"0000-0000-0000-0000-000000000000\",

\"tenant\": \"00000000-0000-0000-0000-000000000000\"

}

These values map to the Terraform variables like so:

-   [appId](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#appId) is
    the client_id defined above.

-   [password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#password) is
    the client_secret defined above.

-   [tenant](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret#tenant) is
    the tenant_id defined above.

Finally, it\'s possible to test these values work as expected by first
logging in:

az login \--service-principal -u CLIENT_ID -p CLIENT_SECRET \--tenant
TENANT_ID

Once logged in as the Service Principal - we should be able to list the
VM sizes by specifying an Azure region, for example here we use the West
US region:

az vm list-sizes \--location westus

**Note**

: If you\'re using the **China**, **German** or **Government** Azure
Clouds - you will need to switch westus out for another region. You can
find which regions are available by running:

az account list-locations

Finally, since we\'re logged into the Azure CLI as a Service Principal
we recommend logging out of the Azure CLI (but you can instead log in
using your user account):

az logout

Information on how to configure the Provider block using the newly
created Service Principal credentials can be found below.
