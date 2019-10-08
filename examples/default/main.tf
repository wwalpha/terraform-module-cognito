module "cognito" {
  source = "../../"
  
  user_pool_name = "CognitoUserPool"
  identity_pool_name = "CognitoIdentityPool"
}
