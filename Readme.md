#terraform, #linode, #kubernetes

### Description
Example usages for terraform

### Project Structure:
-   Creating a 1GB node on linode in node_example folder
-  Creating a kubernetes cluster on linode with 2 2GB node and 1 4GB node in kubernetes_example folder

### Usage
 + Kubernetes Example
```
terraform init
terraform apply --var token=your_linode_token
```
 + Node Example
```
terraform init
terraform apply --var token=your_linode_token --root_pass=root_user_password_for_node
```
