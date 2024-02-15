variable "region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "ecs_poc_cluster"
}

variable "CB-project-name" {
   default = "poc-poject"
}

variable "source-type" {
   default = "CODECOMMIT"
}

variable "location" {
   default = "https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/demo_app_poc_repo"
}

variable "pip-name" {
   default = "poc_dep_pipeline"
}

variable "artifact-loc" {
   default = "poc-artifact-bucket-codepip"
}

variable "artifact-type" {
   default = "S3"
}

variable "repo-branch" {
   default = "main"
}

variable "ecr-repo" {
   default = "ssk-ecr-repo"
}

variable "cpu" {
   default = "256"
}

variable "memory" {
   default = "512"
}

variable "con-name" {
   default = "poc_container"
}

variable "con-port" {
   default = "80"
}

variable "code_com_repo_name" {
  default = "demo_app_poc_repo"
}

variable "subnets" {
   type = list
   default = ["subnet-0b1d7bca8b0ce7182", "subnet-07906ba67b2e98a9e"] 
}