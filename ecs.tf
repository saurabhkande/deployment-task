resource "aws_ecs_cluster" "poc-ecs-cluster" {
  name = var.cluster_name
}

# ECS task definition

resource "aws_ecs_task_definition" "poc_definition" {
  family                   = "Poc-task-definition"
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_task_role.arn
  
  container_definitions    = <<EOF
[
  {
    "name": "poc-container",
    "image": "787367675716.dkr.ecr.ap-south-1.amazonaws.com/ssk-ecr-repo:latest",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp"
      }
    ],

    "deploymentController": {
      "type": "CODE_DEPLOY"
    },

    "environment": [
      {
        "name": "ENVIRONMENT",
        "value": "POC"
      }
    ]
   }
]
EOF
}

# ECS service for the blue environment

resource "aws_ecs_service" "poc_service" {
  name            = "poc-task-service"
  cluster         = aws_ecs_cluster.poc-ecs-cluster.id
  task_definition = aws_ecs_task_definition.poc_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  scheduling_strategy = "REPLICA"

  network_configuration {
     subnets          = ["subnet-0a9f4debc53fd5786"]
     security_groups  = ["sg-052d4cd2b125c82a4"]
     assign_public_ip = true
  }
  
#   load_balancer {
#    target_group_arn = aws_lb_target_group.BG-task-ALB-tg.arn
#    container_name   = var.con-name
#    container_port   = var.con-port
#  }
}


# IAM role for the ECS task

resource "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM policies to the ECS task role

resource "aws_iam_role_policy_attachment" "ecs_task_role_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}