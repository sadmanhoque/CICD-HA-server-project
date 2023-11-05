resource "kubernetes_deployment" "java" {
  metadata {
    name = "microservice-deployment"
    labels = {
      app  = "sample-site"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app  = "sample-site"
      }
    }
    template {
      metadata {
        labels = {
          app  = "sample-site"
        }
      }
      spec {
        container {
          image = "516532666009.dkr.ecr.ca-central-1.amazonaws.com/test-repo:latest"
          name  = "sample-site-container"
          port {
            container_port = 3000
         }
        }
      }
    }
  }
}
resource "kubernetes_service" "java" {
  depends_on = [kubernetes_deployment.java]
  metadata {
    name = "sample-site-service"
  }
  spec {
    selector = {
      app = "sample-site"
    }
    port {
      port        = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}