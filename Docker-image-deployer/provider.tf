provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}

provider "aws" {
    region = "ca-central-1"
    shared_credentials_files = ["/Users/sadma/.aws/credentials"]
    profile = "default"
}