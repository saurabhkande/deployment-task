resource "aws_ecr_repository" "dep_poc_ecr" {
  name = var.ecr-repo  
  tags = {
    Name = "ssk-ecr"
  }
#   image_tag_mutability = "MUTABLE"  # Allow overwriting of tags
}


output "ecr_repo_url" {
  value = aws_ecr_repository.dep_poc_ecr.repository_url
}

