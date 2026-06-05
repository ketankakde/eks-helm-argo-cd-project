resource "aws_ecr_repository" "frontend" {
  name = "var.frontend_name"
}

resource "aws_ecr_repository" "backend" {
  name = "var.backend_name"
}
