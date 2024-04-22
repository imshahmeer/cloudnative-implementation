provider "null" {}

# Provision Minikube cluster
resource "null_resource" "minikube_start" {
  provisioner "local-exec" {
    command     = "minikube ip > minikube_ip.txt"
    interpreter = ["cmd", "/C"] # Specify the shell interpreter for Windows
  }
}

# Read Minikube IP address from the file
data "local_file" "minikube_ip" {
  depends_on = [null_resource.minikube_start]
  filename   = "minikube_ip.txt"
}

output "minikube_ip" {
  value = "http://${data.local_file.minikube_ip.content}"
}
