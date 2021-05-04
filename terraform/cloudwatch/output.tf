output "cloudwatch_cpu_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch CPU metric alarm"
  value       = module.cpu_metric_alarms.cloudwatch_metric_alarm_arn
}

output "cloudwatch_cpu_metric_alarm_id" {
  description = "The ID of the Cloudwatch CPU metric alarm"
  value       = module.cpu_metric_alarms.cloudwatch_metric_alarm_id
}
