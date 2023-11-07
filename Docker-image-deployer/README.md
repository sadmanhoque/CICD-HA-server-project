### Intro

This is a TF script for deploying a docker image hosted in an ECR repo to an EKS cluster.

Remember to write a proper readme file when it's working right.

## Setup instructions

# Make sure K8s is installed

Follow the instructions here:
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

Or just google about installing kubernetes for whatever OS you're running, the program is called kubectl.

# Install and Configure AWS CLI

Google this one, AWS has documentation for the installation process.

Once installation is complete setup the config file by running `aws configure` command. You will need to issue a access key for the user profile for this.

# Install and configure AWS IAM Authenticator for K8s.

Follow AWS instructions for this one, it's pretty easy, the program is available for package managers of most platforms.

# Configure kubectl to use the AWS IAM Authenticator

Follow the instructions here:
https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html

Or if everything is already setup and this just happens to be a new cluster, run this command:

`aws eks update-kubeconfig --region region-code --name my-cluster`

And this one to verify that kube config if configured correctly:

`kubectl get svc`

NOTE: Unless this is not configured correctly the terraform script will not run.

## Terraform commands:

To install dependencies:
`terraform init`

Checks for basic syntax errors and shows what the script is going to do if executed.
`terraform plan`

Executes the script, required a 'yes' prompt but I think you can add a flag to the command to get around it.
`terraform apply`
