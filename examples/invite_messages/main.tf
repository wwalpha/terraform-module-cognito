module "cognito" {
  source = "../../"

  user_pool_name     = "CognitoUserPool"
  identity_pool_name = "CognitoIdentityPool"

  invite_email_subject = "My temporary password"
  invite_email_message = "My username is {username} and temporary password is {####}. "
  invite_sms_message   = "My username is {username} and temporary password is {####}. "
}
