# -------------------------------------------------------------------------------------------
# The name of the user pool.
# -------------------------------------------------------------------------------------------
output "user_pool_name" {
  value = aws_cognito_user_pool.this.name
}

# -------------------------------------------------------------------------------------------
# The id of the user pool.
# -------------------------------------------------------------------------------------------
output "user_pool_id" {
  value = aws_cognito_user_pool.this.id
}

# -------------------------------------------------------------------------------------------
# The ARN of the user pool.
# -------------------------------------------------------------------------------------------
output "user_pool_arn" {
  value = aws_cognito_user_pool.this.arn
}

# -------------------------------------------------------------------------------------------
# The endpoint name of the user pool.
# Example format: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy
# -------------------------------------------------------------------------------------------
output "user_pool_endpoint" {
  value = aws_cognito_user_pool.this.endpoint
}

# -------------------------------------------------------------------------------------------
#The date the user pool was created.
# -------------------------------------------------------------------------------------------
output "user_pool_creation_date" {
  value = aws_cognito_user_pool.this.creation_date
}

# -------------------------------------------------------------------------------------------
# The date the user pool was last modified.
# -------------------------------------------------------------------------------------------
output "user_pool_last_modified_date" {
  value = aws_cognito_user_pool.this.last_modified_date
}

# -------------------------------------------------------------------------------------------
# The id of the user pool client.
# -------------------------------------------------------------------------------------------
output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.this.id
}

# -------------------------------------------------------------------------------------------
# The client secret of the user pool client
# -------------------------------------------------------------------------------------------
output "user_pool_client_secret" {
  value = aws_cognito_user_pool_client.this.client_secret
}

# -------------------------------------------------------------------------------------------
# The name of the identity pool.
# -------------------------------------------------------------------------------------------
output "identity_pool_name" {
  value = var.identity_pool_name
}

# -------------------------------------------------------------------------------------------
# An identity pool ID in the format REGION:GUID.
# -------------------------------------------------------------------------------------------
output "identity_pool_id" {
  value = aws_cognito_identity_pool.this.id
}

# -------------------------------------------------------------------------------------------
# The ARN of the identity pool.
# -------------------------------------------------------------------------------------------
output "identity_pool_arn" {
  value = aws_cognito_identity_pool.this.arn
}

