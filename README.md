# Terraform Module Cognito

## Default

```terraform
module "cognito" {
  source = "github.com/wwalpha/terraform-module-cognito"

  user_pool_name = "CognitoUserPool"
  identity_pool_name = "CognitoIdentityPool"
}
```

## Password Policy

```terraform
module "cognito" {
  source = "github.com/wwalpha/terraform-module-cognito"

  user_pool_name = "CognitoUserPool"
  identity_pool_name = "CognitoIdentityPool"

  
}
```
