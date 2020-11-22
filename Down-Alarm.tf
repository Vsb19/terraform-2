resource "aws_cloudwatch_metric_alarm" "Down-Alarm" {
  alarm_name          = "Alarm-For-Scale-Down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "35"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.asg-1.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = ["${aws_autoscaling_policy.Scale-Down.arn}"]
}