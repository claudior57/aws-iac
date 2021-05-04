module "cpu_metric_alarms" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 2.0"

  alarm_name          = "cpu-usage"
  alarm_description   = "cpu-usage from ec2 is too high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 85
  period              = 300
  unit                = "Percent"

  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"
  statistic   = "Average"
  dimensions = {
    InstanceId = data.terraform_remote_state.ec2.outputs.ec2_id[0]
  }
  alarm_actions = [data.terraform_remote_state.sns.outputs.sns_alarms_arn]

}
