# resource "aws_lb" "poc_ecs_alb" {
#  name               = "ecs-alb"
#  internal           = false
#  load_balancer_type = "application"
#  security_groups    = [data.aws_security_group.security_group.id]
#  subnets            = [var.subnets[0], var.subnets[1]]

#  tags = {
#    Name = "ecs-alb"
#  }
# }

# resource "aws_lb_listener" "poc_ecs_alb_listener" {
#  load_balancer_arn = aws_lb.poc_ecs_alb.arn
#  port              = 80
#  protocol          = "HTTP"

#  default_action {
#    type             = "forward"
#    target_group_arn = aws_lb_target_group.poc_ecs_tg.arn
#  }
# }

# resource "aws_lb_target_group" "poc_ecs_tg" {
#  name        = "ecs-target-group"
#  port        = 80
#  protocol    = "HTTP"
#  target_type = "ip"
#  vpc_id      = data.aws_vpc.default_vpc.id

#  health_check {
#    path = "/"
#  }
# }


# data "aws_vpc" "default_vpc" {
#   id = "vpc-01806dab4e92f00ff"
# }

# # data "aws_subnet" "subnets_ids" {
# #   vpc_id = data.aws_vpc.default_vpc.id

# # }

# data "aws_security_group" "security_group" {
#   name = "default"
#   vpc_id = data.aws_vpc.default_vpc.id

# }



#  {
#     "family": "Poc-task-definition",
#     "containerDefinitions": [
#       {
#         "name": "poc-con",
#         "image": "787367675716.dkr.ecr.ap-south-1.amazonaws.com/ssk-ecr-repo:latest",
#         "cpu": 256,
#         "memory": 512,
#         "essential": true,
#         "portMappings": [
#           {
#             "containerPort": 80,
#             "hostPort": 80
#           }
#         ]
#       }
#     ],
#     "compatibilities": [
#         "EC2",
#         "FARGATE"
#     ],
#     "requiresCompatibilities": [
#         "FARGATE"
#     ],
#     "executionRoleArn": "arn:aws:iam::787367675716:role/ecs_task_role",
#     "networkMode": "awsvpc",
#     "cpu": "256",
#     "memory": "512"
#   }
