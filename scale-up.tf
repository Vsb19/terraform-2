resource "aws_autoscaling_policy" "scale-up" {

  name                   = "Scale-Up-Policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.asg-1.name}"
  
}