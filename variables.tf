# -------------------------------------------------------------------------------------------
# The name of the user pool.
# -------------------------------------------------------------------------------------------
variable "user_pool_name" {}
# -------------------------------------------------------------------------------------------
# Set to True if only the administrator is allowed to create user profiles. 
# Set to False if users can sign themselves up via an app.
# -------------------------------------------------------------------------------------------
variable "allow_admin_create_user_only" {
  default = false
}
# -------------------------------------------------------------------------------------------
# The subject line for email messages.
# -------------------------------------------------------------------------------------------
variable "invite_email_subject" {
  default = "Your temporary password"
}
# -------------------------------------------------------------------------------------------
# The message template for email messages. Must contain {username} and {####} placeholders, 
# for username and temporary password, respectively.
# -------------------------------------------------------------------------------------------
variable "invite_email_message" {
  default = "Your username is {username} and temporary password is {####}."
}
# -------------------------------------------------------------------------------------------
# The message template for SMS messages. Must contain {username} and {####} placeholders
# for username and temporary password, respectively.
# -------------------------------------------------------------------------------------------
variable "invite_sms_message" {
  default = "Your username is {username} and temporary password is {####}."
}
# -------------------------------------------------------------------------------------------
# The user account expiration limit, in days, after which the account is no longer usable.
# -------------------------------------------------------------------------------------------
variable "unused_account_validity_days" {
  default = null
}
# -------------------------------------------------------------------------------------------
# Attributes supported as an alias for this user pool. Possible values: phone_number, email, or preferred_username.
# Conflicts with username_attributes.
# -------------------------------------------------------------------------------------------
variable "alias_attributes" {
  default = null
}
# -------------------------------------------------------------------------------------------
# The attributes to be auto-verified. Possible values: email, phone_number.
# -------------------------------------------------------------------------------------------
variable "auto_verified_attributes" {
  default = []
}
# -------------------------------------------------------------------------------------------
# Indicates whether a challenge is required on a new device. Only applicable to a new device.
# -------------------------------------------------------------------------------------------
variable "challenge_required_on_new_device" {
  default = null
}
# -------------------------------------------------------------------------------------------
# If true, a device is only remembered on user prompt.
# -------------------------------------------------------------------------------------------
variable "device_only_remembered_on_user_prompt" {
  default = false
}
# -------------------------------------------------------------------------------------------
# A string representing the email verification subject. 
# Conflicts with verification_message_template configuration block email_subject argument.
# -------------------------------------------------------------------------------------------
variable "email_verification_subject" {
  default = "Your verification code"
}
# -------------------------------------------------------------------------------------------
# A string representing the email verification message. 
# Conflicts with verification_message_template configuration block email_message argument.
# -------------------------------------------------------------------------------------------
variable "email_verification_message" {
  default = "Your verification code is {####}. "
}
# -------------------------------------------------------------------------------------------
# Set to enable multi-factor authentication. Must be one of the following values (ON, OFF, OPTIONAL)
# -------------------------------------------------------------------------------------------
variable "mfa_configuration" {
  default = "OFF"
}
# -------------------------------------------------------------------------------------------
# A string representing the SMS authentication message.
# -------------------------------------------------------------------------------------------
variable "sms_authentication_message" {
  default = "Your authentication code is {####}. "
}
# -------------------------------------------------------------------------------------------
# A string representing the SMS verification message. 
# Conflicts with verification_message_template configuration block sms_message argument.
# -------------------------------------------------------------------------------------------
variable "sms_verification_message" {
  default = null
}
# -------------------------------------------------------------------------------------------
# Specifies whether email addresses or phone numbers can be specified as usernames when a user signs up. 
# Conflicts with alias_attributes.
# -------------------------------------------------------------------------------------------
variable "username_attributes" {
  default = null
}
# -------------------------------------------------------------------------------------------
# A mapping of tags to assign to the User Pool.
# -------------------------------------------------------------------------------------------
variable "user_pool_tags" {
  default = null
}
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Email Configuration
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The REPLY-TO email address.
# -------------------------------------------------------------------------------------------
variable "reply_to_email_address" {
  default = null
}
# # -------------------------------------------------------------------------------------------
# # Instruct Cognito to either use its built-in functional or Amazon SES to send out
# # -------------------------------------------------------------------------------------------
# variable "email_sending_account" {
#   default = false
# }
# -------------------------------------------------------------------------------------------
# The ARN of the email source.
# -------------------------------------------------------------------------------------------
variable "email_source_arn" {
  default = null
}

# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Lambda Configuration
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The ARN of the lambda creating an authentication challenge.
# -------------------------------------------------------------------------------------------
variable "create_auth_challenge" {
  default = null
}
# -------------------------------------------------------------------------------------------
# A custom Message AWS Lambda trigger.
# -------------------------------------------------------------------------------------------
variable "custom_message" {
  default = null
}
# -------------------------------------------------------------------------------------------
# Defines the authentication challenge.
# -------------------------------------------------------------------------------------------
variable "define_auth_challenge" {
  default = null
}
# -------------------------------------------------------------------------------------------
# A post-authentication AWS Lambda trigger.
# -------------------------------------------------------------------------------------------
variable "post_authentication" {
  default = null
}
# -------------------------------------------------------------------------------------------
# A post-confirmation AWS Lambda trigger.
# -------------------------------------------------------------------------------------------
variable "post_confirmation" {
  default = null
}
# -------------------------------------------------------------------------------------------
# A pre-authentication AWS Lambda trigger.
# -------------------------------------------------------------------------------------------
variable "pre_authentication" {
  default = null
}
# -------------------------------------------------------------------------------------------
# A pre-registration AWS Lambda trigger.
# -------------------------------------------------------------------------------------------
variable "pre_sign_up" {
  default = null
}
# -------------------------------------------------------------------------------------------
# Allow to customize identity token claims before token generation.
# -------------------------------------------------------------------------------------------
variable "pre_token_generation" {
  default = null
}
# -------------------------------------------------------------------------------------------
# The user migration Lambda config type.
# -------------------------------------------------------------------------------------------
variable "user_migration" {
  default = null
}
# -------------------------------------------------------------------------------------------
# Verifies the authentication challenge response.
# -------------------------------------------------------------------------------------------
variable "verify_auth_challenge_response" {
  default = null
}

# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Password Policy
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The minimum length of the password policy that you have set.
# -------------------------------------------------------------------------------------------
variable "password_minimum_length" {
  default = 20
}
# -------------------------------------------------------------------------------------------
# Whether you have required users to use at least one lowercase letter in their password.
# -------------------------------------------------------------------------------------------
variable "password_require_lowercase" {
  default = true
}
# -------------------------------------------------------------------------------------------
# Whether you have required users to use at least one number in their password.
# -------------------------------------------------------------------------------------------
variable "password_require_numbers" {
  default = true
}
# -------------------------------------------------------------------------------------------
# Whether you have required users to use at least one symbol in their password.
# -------------------------------------------------------------------------------------------
variable "password_require_symbols" {
  default = true
}
# -------------------------------------------------------------------------------------------
# Whether you have required users to use at least one uppercase letter in their
# -------------------------------------------------------------------------------------------
variable "password_require_uppercase" {
  default = true
}
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Schema Attributes
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
variable "schema" {
  type = list(object({
    # ---------------------------------------------------------------------------------------
    # The name of the attribute.
    # ---------------------------------------------------------------------------------------
    name = string
    # -------------------------------------------------------------------------------------------
    # The attribute data type. Must be one of Boolean, Number, String, DateTime.
    # -------------------------------------------------------------------------------------------
    attribute_data_type = string
    # -------------------------------------------------------------------------------------------
    # Specifies whether the attribute type is developer only.
    # -------------------------------------------------------------------------------------------
    developer_only_attribute = bool
    # -------------------------------------------------------------------------------------------
    # Specifies whether the attribute can be changed once it has been created.
    # -------------------------------------------------------------------------------------------
    mutable = bool
    # -------------------------------------------------------------------------------------------
    # Specifies whether a user pool attribute is required. 
    # If the attribute is required and the user does not provide a value, registration or sign-in will fail.
    # -------------------------------------------------------------------------------------------
    required = bool
    # -------------------------------------------------------------------------------------------
    # The maximum length of an attribute value of the string type.
    # -------------------------------------------------------------------------------------------
    string_attribute_max_length = string
    # -------------------------------------------------------------------------------------------
    # The minimum length of an attribute value of the string type.
    # -------------------------------------------------------------------------------------------
    string_attribute_min_length = string
  }))
  default = []
}

# # -------------------------------------------------------------------------------------------
# # The maximum value of an attribute that is of the number data type.
# # -------------------------------------------------------------------------------------------
# variable "number_attribute_max_value" {
#   default = null
# }
# # -------------------------------------------------------------------------------------------
# # The minimum value of an attribute that is of the number data type.
# # -------------------------------------------------------------------------------------------
# variable "number_attribute_min_value" {
#   default = null
# }



# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# SMS Configuration
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The external ID used in IAM role trust relationships. 
# -------------------------------------------------------------------------------------------
# variable "sms_external_id" {
#   default = null
# }
# # -------------------------------------------------------------------------------------------
# # The ARN of the Amazon SNS caller. 
# # This is usually the IAM role that you've given Cognito permission to assume.
# # -------------------------------------------------------------------------------------------
# variable "sns_caller_arn" {
#   default = null
# }

# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# User Pool Add-ons
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The mode for advanced security, must be one of OFF, AUDIT or ENFORCED.
# -------------------------------------------------------------------------------------------
variable "advanced_security_mode" {
  default = "OFF"
}

# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Verification Message Template
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The default email option. Must be either CONFIRM_WITH_CODE or CONFIRM_WITH_LINK. Defaults to CONFIRM_WITH_CODE.
# -------------------------------------------------------------------------------------------
variable "verify_default_email_option" {
  default = "CONFIRM_WITH_CODE"
}
# -------------------------------------------------------------------------------------------
# The email message template. Must contain the {####} placeholder. Conflicts with email_verification_message argument.
# -------------------------------------------------------------------------------------------
variable "verify_email_message" {
  default = null
}
# -------------------------------------------------------------------------------------------
# The email message template for sending a confirmation link to the user, 
# it must contain the {##Click Here##} placeholder.
# -------------------------------------------------------------------------------------------
variable "verify_email_message_by_link" {
  default = null
}
# -------------------------------------------------------------------------------------------
# The subject line for the email message template. 
# Conflicts with email_verification_subject argument.
# -------------------------------------------------------------------------------------------
variable "verify_email_subject" {
  default = null
}
# -------------------------------------------------------------------------------------------
# The subject line for the email message template for sending a confirmation link to the user.
# -------------------------------------------------------------------------------------------
variable "verify_email_subject_by_link" {
  default = null
}
# -------------------------------------------------------------------------------------------
# The SMS message template. Must contain the {####} placeholder.
#  Conflicts with sms_verification_message argument.
# -------------------------------------------------------------------------------------------
variable "verify_sms_message" {
  default = null
}

# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Amazon Cognito User Pool Client
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# List of allowed OAuth flows (code, implicit, client_credentials).
# -------------------------------------------------------------------------------------------
variable "allowed_oauth_flows" {
  default = []
}
# -------------------------------------------------------------------------------------------
# Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools.
# -------------------------------------------------------------------------------------------
variable "allowed_oauth_flows_user_pool_client" {
  default = false
}
# -------------------------------------------------------------------------------------------
# List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin).
# -------------------------------------------------------------------------------------------
variable "allowed_oauth_scopes" {
  default = []
}
# -------------------------------------------------------------------------------------------
# List of allowed callback URLs for the identity providers.
# -------------------------------------------------------------------------------------------
variable "callback_urls" {
  default = []
}
# -------------------------------------------------------------------------------------------
# The default redirect URI. Must be in the list of callback URLs.
# -------------------------------------------------------------------------------------------
variable "default_redirect_uri" {
  default = null
}
# -------------------------------------------------------------------------------------------
# List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH).
# -------------------------------------------------------------------------------------------
variable "explicit_auth_flows" {
  default = ["ADMIN_NO_SRP_AUTH"]
}
# -------------------------------------------------------------------------------------------
# Should an application secret be generated.
# -------------------------------------------------------------------------------------------
variable "generate_secret" {
  default = false
}
# -------------------------------------------------------------------------------------------
# List of allowed logout URLs for the identity providers.
# -------------------------------------------------------------------------------------------
variable "logout_urls" {
  default = []
}
# -------------------------------------------------------------------------------------------
# List of user pool attributes the application client can read from.
# -------------------------------------------------------------------------------------------
variable "read_attributes" {
  default = []
}
# -------------------------------------------------------------------------------------------
# List of user pool attributes the application client can write to.
# -------------------------------------------------------------------------------------------
variable "write_attributes" {
  default = []
}
# -------------------------------------------------------------------------------------------
#  The time limit in days refresh tokens are valid for.
# -------------------------------------------------------------------------------------------
variable "refresh_token_validity" {
  default = null
}
# -------------------------------------------------------------------------------------------
#  List of provider names for the identity providers that are supported on this client.
# -------------------------------------------------------------------------------------------
variable "supported_identity_providers" {
  default = []
}

# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Amazon Cognito User Pool Domain
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The domain string.
# -------------------------------------------------------------------------------------------
variable "domain" {
  default = null
}
# -------------------------------------------------------------------------------------------
# The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain.
# -------------------------------------------------------------------------------------------
variable "certificate_arn" {
  default = null
}

# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# Amazon Cognito User Pool Domain
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# -------------------------------------------------------------------------------------------
# The Cognito Identity Pool name.
# -------------------------------------------------------------------------------------------
variable "identity_pool_name" {
  default = null
}
# -------------------------------------------------------------------------------------------
# Whether the identity pool supports unauthenticated logins or not.
# -------------------------------------------------------------------------------------------
variable "allow_unauthenticated_identities" {
  default = false
}
# -------------------------------------------------------------------------------------------
# The "domain" by which Cognito will refer to your users. 
# This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider.
# -------------------------------------------------------------------------------------------
variable "developer_provider_name" {
  default = null
}
# -------------------------------------------------------------------------------------------
# An array of Amazon Cognito Identity user pools and their client IDs.
# -------------------------------------------------------------------------------------------
variable "cognito_identity_providers" {
  default = []
}
# -------------------------------------------------------------------------------------------
# A list of OpendID Connect provider ARNs.
# -------------------------------------------------------------------------------------------
variable "openid_connect_provider_arns" {
  default = []
}
# -------------------------------------------------------------------------------------------
# An array of Amazon Resource Names (ARNs) of the SAML provider for your identity.
# -------------------------------------------------------------------------------------------
variable "saml_provider_arns" {
  default = []
}
# -------------------------------------------------------------------------------------------
# Key-Value pairs mapping provider names to provider app IDs.
# -------------------------------------------------------------------------------------------
variable "supported_login_providers" {
  default = null
}
# -------------------------------------------------------------------------------------------
# A mapping of tags to assign to the Identity Pool.
# -------------------------------------------------------------------------------------------
variable "identity_pool_tags" {
  default = null
}

# identity_provider (Required) - A string identifying the identity provider, for example, "graph.facebook.com" or "cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id".
# ambiguous_role_resolution (Optional) - Specifies the action to be taken if either no rules match the claim value for the Rules type, or there is no cognito:preferred_role claim and there are multiple cognito:roles matches for the Token type. Required if you specify Token or Rules as the Type.
# mapping_rule (Optional) - The Rules Configuration to be used for mapping users to roles. You can specify up to 25 rules per identity provider. Rules are evaluated in order. The first one to match specifies the role.
# type (Required) - The role mapping type.
# claim (Required) - The claim name that must be present in the token, for example, "isAdmin" or "paid".
# match_type (Required) - The match condition that specifies how closely the claim value in the IdP token must match Value.
# role_arn (Required) - The role ARN.
# value (Required) - A brief string that the claim must match, for example, "paid" or "yes".


# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
# AWS Cognito Identity Pool Role
# ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
variable "authenticated_role_name" {
  default = null
}
variable "unauthenticated_role_name" {
  default = null
}
