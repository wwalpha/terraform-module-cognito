# -------------------------------------------------------
# Amazon Cognito User Pool
# -------------------------------------------------------
resource "aws_cognito_user_pool" "this" {
  name = "${var.user_pool_name}"

  alias_attributes           = "${var.alias_attributes}"
  auto_verified_attributes   = "${var.auto_verified_attributes}"
  mfa_configuration          = "${var.mfa_configuration}"
  email_verification_subject = "${var.email_verification_subject}"
  email_verification_message = "${var.email_verification_message}"
  sms_authentication_message = "${var.sms_authentication_message}"
  sms_verification_message   = "${var.sms_verification_message}"
  username_attributes        = "${var.username_attributes}"
  tags                       = "${var.user_pool_tags}"

  admin_create_user_config {
    allow_admin_create_user_only = "${var.allow_admin_create_user_only}"
    # temporary_password_validity_days = "${var.unused_account_validity_days}"

    invite_message_template {
      email_subject = "${var.invite_email_subject}"
      email_message = "${var.invite_email_message}"
      sms_message   = "${var.invite_sms_message}"
    }
  }

  device_configuration {
    challenge_required_on_new_device      = "${var.challenge_required_on_new_device}"
    device_only_remembered_on_user_prompt = "${var.device_only_remembered_on_user_prompt}"
  }

  email_configuration {
    reply_to_email_address = "${var.reply_to_email_address}"
    source_arn             = "${var.email_source_arn}"
  }

  lambda_config {
    create_auth_challenge          = "${var.create_auth_challenge}"
    custom_message                 = "${var.custom_message}"
    define_auth_challenge          = "${var.define_auth_challenge}"
    post_authentication            = "${var.post_authentication}"
    post_confirmation              = "${var.post_confirmation}"
    pre_authentication             = "${var.pre_authentication}"
    pre_sign_up                    = "${var.pre_sign_up}"
    pre_token_generation           = "${var.pre_token_generation}"
    user_migration                 = "${var.user_migration}"
    verify_auth_challenge_response = "${var.verify_auth_challenge_response}"
  }

  password_policy {
    minimum_length    = "${var.password_minimum_length}"
    require_lowercase = "${var.password_require_lowercase}"
    require_numbers   = "${var.password_require_numbers}"
    require_symbols   = "${var.password_require_symbols}"
    require_uppercase = "${var.password_require_uppercase}"
  }

  dynamic "sms_configuration" {
    for_each = "${local.sms_configuration}"

    content {
      external_id    = "${sms_configuration.external_id}"
      sns_caller_arn = "${sms_configuration.sns_caller_arn}"
    }
  }

  user_pool_add_ons {
    advanced_security_mode = "${var.advanced_security_mode}"
  }

  verification_message_template {
    default_email_option  = "${var.verify_default_email_option}"
    email_message         = "${var.verify_email_message}"
    email_message_by_link = "${var.verify_email_message_by_link}"
    email_subject         = "${var.verify_email_subject}"
    email_subject_by_link = "${var.verify_email_subject_by_link}"
    sms_message           = "${var.verify_sms_message}"
  }
}


# -------------------------------------------------------
# Amazon Cognito User Pool Client
# -------------------------------------------------------
resource "aws_cognito_user_pool_client" "this" {
  name = "${var.user_pool_name}Client"

  user_pool_id = "${aws_cognito_user_pool.this.id}"

  allowed_oauth_flows                  = "${var.allowed_oauth_flows}"
  allowed_oauth_flows_user_pool_client = "${var.allowed_oauth_flows_user_pool_client}"
  allowed_oauth_scopes                 = "${var.allowed_oauth_scopes}"
  callback_urls                        = "${var.callback_urls}"
  default_redirect_uri                 = "${var.default_redirect_uri}"
  explicit_auth_flows                  = "${var.explicit_auth_flows}"
  generate_secret                      = "${var.generate_secret}"
  logout_urls                          = "${var.logout_urls}"
  read_attributes                      = "${var.read_attributes}"
  refresh_token_validity               = "${var.refresh_token_validity}"
  supported_identity_providers         = "${var.supported_identity_providers}"
  write_attributes                     = "${var.write_attributes}"
}

# -------------------------------------------------------
# Amazon Cognito User Pool Client Domain
# -------------------------------------------------------
resource "aws_cognito_user_pool_domain" "this" {
  domain          = "${var.domain}"
  user_pool_id    = "${aws_cognito_user_pool.this.id}"
  certificate_arn = "${var.certificate_arn}"

  count = "${var.domain != null ? 1 : 0}"
}
