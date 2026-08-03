# Terraform Azure Infrastructure

This project uses Terraform to deploy Azure infrastructure using reusable modules and Infrastructure as Code (IaC).

## Project Structure

```text
Terraform-infrastructure-code/
├── environments/
│   └── dev/
│
├── modules/
│   ├── azurerm_bastion/
│   ├── azurerm_rg/
│   ├── azurerm_subnet/
│   ├── azurerm_vm/
│   └── azurerm_vnet/
│
├── .gitignore
└── README.md
Azure Resources
Resource Group
Virtual Network
Subnet
Virtual Machine
Azure Bastion
Technologies
Microsoft Azure
Terraform
AzureRM Provider
Git
GitHub
Terraform Workflow
Terraform Code
      ↓
terraform init
      ↓
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
      ↓
Azure Infrastructure
Terraform Commands
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
Key Features
Reusable Terraform modules
Environment-based configuration
Azure Infrastructure as Code
Modular and maintainable architecture
Author

Navjot
