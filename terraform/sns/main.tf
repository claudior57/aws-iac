module "sns_alarms_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 3.0"

  name  = "alarms-topic"
}

resource "aws_sns_topic_subscription" "sns_send_email_alarm" {
  endpoint = "devops@iaclab.com"
  protocol = "email"
  topic_arn = module.sns_alarms_topic.sns_topic_arn
}