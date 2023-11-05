
resource "kubernetes_deployment" "my_app" {
  metadata {
    name = "my-app-deployment"
  }

  spec {
    replicas = 3

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          image = "516532666009.dkr.ecr.ca-central-1.amazonaws.com/test-repo:latest"  # Replace with your ECR image URL
          name  = "my-app-container"

          # Add other container settings (ports, environment variables, etc.) as needed
        }
      }
    }
  }
}

resource "kubernetes_service" "my_app" {
  metadata {
    name = "my-app-service"
  }

  spec {
    selector = {
      app = "my-app"
    }

    port {
      port        = 80
      target_port = 80
    }
  }
}
