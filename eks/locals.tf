locals {
    cluster_tags = merge(
        var.tags,
        {
            "kubernetes.io/cluster/${var.cluster_name}" = "owned"
        }
    )
}

locals {
  eks_node_policies = [
    "AmazonEKSWorkerNodePolicy",
    "AmazonEC2ContainerRegistryReadOnly",
    "AmazonEKS_CNI_Policy"
  ]
}