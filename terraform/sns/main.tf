module "sns_alarms_topic" {
  source  = "terraform-aws-modules/sns/aws"
  name = "alarms-topic"
}

resource "aws_sns_topic_subscription" "sns_send_email_alarm" {
  endpoint  = "devops@iaclab.com" #use an email that you have access
  protocol  = "email"
  topic_arn = module.sns_alarms_topic.topic_arn
}