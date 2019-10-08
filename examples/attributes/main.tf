module "cognito" {
  source = "../../"

  user_pool_name     = "CognitoUserPool"
  identity_pool_name = "CognitoIdentityPool"

  # invite_email_subject = "test"
  # invite_email_message = "Must contain {username} and {####} placeholders"
}
