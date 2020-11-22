resource "aws_elb" "my-alb" {

    name = "my-alb"
    internal = false
    #load_balancer_type = "application"
    security_groups = ["${aws_security_group.webserver-sg.id}"]
    subnets = ["subnet-2a444242", "subnet-b897e3f4", "subnet-9a8937e1"]


    listener{
        instance_port = 80
        instance_protocol = "HTTP"
        lb_port = 80
        lb_protocol = "HTTP"

    }

    health_check {
        healthy_threshold = 5
        interval          = 30
        target            = "HTTP:80/"
        unhealthy_threshold =5
        timeout             = 10     
    }
  
}
