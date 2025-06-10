resource "aws_instance" "api" {
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id      # passing the value from vpc module-output.tf in root file
  vpc_security_group_ids = [aws_security_group.api_sg.id]
  ami                    = var.ami_id
  tags = {
    name = "${var.env_name}-api"
    env  = var.env_name
    # lifecycle = var.lifecycle
  }
}

resource "aws_security_group" "api_sg" {
  vpc_id      = var.vpc_id             # passing the value from vpc module in root file
  description = "sg for api instance"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "${var.env_name}-api-SG"
    env  = var.env_name
  }
}