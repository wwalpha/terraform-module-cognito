module "cognito" {
  source = "../../"

  user_pool_name     = "CognitoUserPool"
  identity_pool_name = "CognitoIdentityPool"

  allow_admin_create_user_only = true
  password_minimum_length      = 10
  password_require_lowercase   = false
  password_require_numbers     = false
  password_require_symbols     = false
  password_require_uppercase   = false
}
