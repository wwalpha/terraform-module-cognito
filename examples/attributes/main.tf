module "cognito" {
  source = "../../"

  user_pool_name     = "CognitoUserPool"
  identity_pool_name = "CognitoIdentityPool"

  username_attributes      = ["email", "phone_number"]
  auto_verified_attributes = ["email"]
  schema = [
    {
      name                        = "address"
      attribute_data_type         = "String"
      developer_only_attribute    = false
      mutable                     = true
      required                    = true
      string_attribute_max_length = "2048"
      string_attribute_min_length = "0"
    },
    {
      name                        = "profile"
      attribute_data_type         = "String"
      developer_only_attribute    = false
      mutable                     = true
      required                    = true
      string_attribute_max_length = "2048"
      string_attribute_min_length = "0"
    },
    {
      name                        = "test"
      attribute_data_type         = "String"
      developer_only_attribute    = false
      mutable                     = true
      required                    = false
      string_attribute_max_length = "10"
      string_attribute_min_length = "0"
    },
  ]
}

