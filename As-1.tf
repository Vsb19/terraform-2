resource "aws_autoscaling_group" "asg-1" {
  name                      = "asg-1"
  launch_configuration      = "${aws_launch_configuration.mylc.name}"
  max_size                  = 5
  min_size                  = 2
  desired_capacity          = 3
  vpc_zone_identifier       = ["subnet-2a444242" ,"subnet-9a8937e1", "subnet-b897e3f4"]
  health_check_type         = "ELB"
  load_balancers            = ["${aws_elb.my-alb.id}"]
  health_check_grace_period = 300
  tag{
      key = "Name"
      value = "My-Server"
      propagate_at_launch = true
    }
}

