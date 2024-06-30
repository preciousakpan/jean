provider "kubernetes" {
  config_path = "./k3s.yaml"  
}

resource "kubernetes_namespace" "argocd_namespace" {
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_manifest" "argocd_application_controller" {
  manifest = templatefile("./argocd.yaml", {})

  depends_on = [kubernetes_namespace.argocd_namespace]
}
