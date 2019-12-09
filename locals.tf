locals {
  empty_list = []
  sms_configuration_list = [
    {
      "external_id"    = local.external_id
      "sns_caller_arn" = aws_iam_role.sms[0].arn
    },
  ]
  sms_configuration = local.mfa_enabled ? local.sms_configuration_list : local.empty_list

  # invite_message_template_map = "${map(
  #   "email_subject", var.invite_email_subject,
  #   "email_message", var.invite_email_message,
  #   "sms_message", var.invite_sms_message,
  # )}"

  # invite_message_template = "${var.invite_email_subject != null || var.invite_email_message != null || var.invite_sms_message != null
  #   ? local.invite_message_template_map
  #   : local.empty_map
  # }"

  authenticated_role_name = var.authenticated_role_name != null ? var.authenticated_role_name : "${var.identity_pool_name}_AuthenticatedRole"

  unauthenticated_role_name = var.unauthenticated_role_name != null ? var.unauthenticated_role_name : "${var.identity_pool_name}_UnauthenticatedRole"

  external_id = uuid()

  # MFA Enabled
  mfa_enabled = var.mfa_configuration == "ON" || var.mfa_configuration == "OPTIONAL"

  auto_verified_attributes_mfa = ["email", "phone_number"]
  auto_verified_attributes     = length(var.auto_verified_attributes) != 0 ? var.auto_verified_attributes : null
}

