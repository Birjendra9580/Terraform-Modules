# Cluster Role
data "aws_iam_policy_document" "eks_cluster_assume"{
    statement {
      actions = ["sts:AssumeRole"]
      principals {
        type = "Service"
        identifiers = ["eks.amazonaws.com"]
      }
    }
}

resource "aws_iam_role" "eks_cluster_role" {
    name = "${var.cluster_name}-cluster-role"
    assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume.json
    tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cluster_policy" {
    role = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Node Role

data "aws_iam_policy_document" "eks_node_assume"{
    statement {
      actions = ["sts:AssumeRole"]
      principals {
        type = "Service"
        identifiers = ["ec2.amazonaws.com"]
      }
    }
}

resource "aws_iam_role" "eks_node_role" {
    name = "${var.cluster_name}-node-role"
    assume_role_policy = data.aws_iam_policy_document.eks_node_assume.json
    tags = var.tags
}

resource "aws_iam_role_policy_attachment" "node_policies" {
    for_each = toset(local.eks_node_policies)

    role = aws_iam_role.eks_node_role.name
    policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/${each.key}"
}