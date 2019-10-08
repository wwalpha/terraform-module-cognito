# ---------------------------------------------------------------
# AWS Cognito MFA SMS Principals JSON
# ---------------------------------------------------------------
data "template_file" "cognito_principal_sms" {
  template = "${file("${path.module}/iam/cognito_principal_sms.tpl")}"
  vars = {
    external_id = "${local.external_id}"
  }
}

# ---------------------------------------------------------------
# AWS Cognito MFA SMS Role 
# ---------------------------------------------------------------
resource "aws_iam_role" "sms" {
  name               = "${var.user_pool_name}_SMS_Role"
  assume_role_policy = "${data.template_file.cognito_principal_sms.rendered}"
  count              = "${local.mfa_enabled ? 1 : 0}"
}

# ---------------------------------------------------------------
# AWS Cognito MFA SMS Policy
# ---------------------------------------------------------------
resource "aws_iam_role_policy" "sms" {
  role   = "${aws_iam_role.sms.0.id}"
  policy = "${file("${path.module}/iam/policy_sns.json")}"
  count  = "${local.mfa_enabled ? 1 : 0}"
}
