# AutoScaling Groups 
resource "aws_launch_configuration" "example" {
  name            = "ex-lc"
  image_id        = "ami-07f511bbb843bdd9d"
  instance_type   = "t2.micro"  
  security_groups = [aws_security_group.example_sg.id]
  
  user_data = <<-EOF
  #!/bin/bash 
  sudo yum install epel-release -y
  sudo yum install nginx -y 
  sudo systemctl start nginx
  ping -c2 google.com 
  EOF
}

resource "aws_autoscaling_group" "example" {
  launch_configuration  = aws_launch_configuration.example.name
  vpc_zone_identifier   = data.aws_subnet_ids.default.ids
  #target_group_arns    = [aws_lb_target_group.asg.arn]
  load_balancers        = ["${aws_lb.example.name}"]
  health_check_type     = "ELB" 

  min_size              = 2
  max_size              = 5

  tag {
    key                 = "Name"
    value               = "tf-asg-exmple"
    propagate_at_launch = true 
  } 
}
