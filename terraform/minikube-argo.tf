# Define Kubernetes resources for ArgoCD
resource "kubernetes_deployment" "argocd_server" {
  metadata {
    name = "argocd-server"
  }

  spec {
    selector {
      match_labels = {
        app = "argocd-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "argocd-server"
        }
      }

      spec {
        container {
          name  = "argocd-server"
          image = "argoproj/argocd:v2.1.4"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "argocd_server" {
  metadata {
    name = "argocd-server"
  }

  spec {
    selector = {
      app = "argocd-server"
    }

    port {
      port        = 80
      target_port = 8080
    }
  }
}

# Define Ingress for ArgoCD (if applicable)
# You may need to install an Ingress controller in your Minikube cluster for this to work
resource "kubernetes_ingress" "argocd_server" {
  metadata {
    name = "argocd-server"
  }

  spec {
    rule {
      host = "argocd.example.com"
      http {
        path {
          path = "/"
          backend {
            service_name = kubernetes_service.argocd_server.metadata[0].name
            service_port = kubernetes_service.argocd_server.spec[0].port[0].port
          }
        }
      }
    }
  }
}
