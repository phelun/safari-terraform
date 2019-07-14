provider "aws" {
  region = "eu-west-1" 
}

#resource "aws_instance" "example" {
#  ami           = "ami-07f511bbb843bdd9d"
#  instance_type = "t2.micro"
#  vpc_security_group_ids = [aws_security_group.example_sg.id]
   
#  user_data = <<-EOF
#  #!/bin/bash 
#  sudo yum install epel-release -y
#  sudo yum install nginx -y 
#  sudo systemctl start nginx
#  #nohup busybox http -f -p ${var.server_port} &
#  ping -c2 google.com 
#  EOF

#  tags = {
#    Name = "tf-examp"
#  }
#}

resource "aws_security_group" "example_sg" {
  name = "tf_example_sg"
  ingress {
    from_port = var.server_port
    to_port   = var.server_port
    protocol  = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#output "public_ip" {
#  value       = aws_instance.example.public_ip
#  description = "Obtain pub ip" 
#}
