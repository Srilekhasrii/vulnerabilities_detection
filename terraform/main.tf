resource "aws_ecs_cluster" "my_cluster" {
  name = "my-app-cluster"
}

resource "aws_ecs_task_definition" "my_app_task" {
  family                   = "my-app-task"
  container_definitions    = file("${path.module}/container_definitions.json")
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
}
