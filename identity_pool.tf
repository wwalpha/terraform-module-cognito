# ---------------------------------------------------------------
# AWS Cognito Identity Pool
# ---------------------------------------------------------------
resource "aws_cognito_identity_pool" "this" {
  depends_on = [aws_cognito_user_pool_client.this]

  identity_pool_name               = var.identity_pool_name
  allow_unauthenticated_identities = var.allow_unauthenticated_identities
  developer_provider_name          = var.developer_provider_name
  openid_connect_provider_arns     = var.openid_connect_provider_arns
  saml_provider_arns               = var.saml_provider_arns
  supported_login_providers        = var.supported_login_providers

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.this.id
    provider_name           = aws_cognito_user_pool.this.endpoint
    server_side_token_check = false
  }
  # supported_login_providers {
  #   "graph.facebook.com"  = "${var.facebook_provider_client_id}"
  #   "accounts.google.com" = "${var.google_provider_client_id}"
  # }
}

# ---------------------------------------------------------------
# AWS Cognito Identity Pool Role Attachment
# ---------------------------------------------------------------
resource "aws_cognito_identity_pool_roles_attachment" "this" {
  identity_pool_id = aws_cognito_identity_pool.this.id

  # role_mapping {
  #   identity_provider         = "graph.facebook.com"
  #   ambiguous_role_resolution = "AuthenticatedRole"
  #   type                      = "Rules"

  #   mapping_rule {
  #     claim      = "isAdmin"
  #     match_type = "Equals"
  #     role_arn   = "${aws_iam_role.cognito.arn}"
  #     value      = "paid"
  #   }
  # }

  roles = {
    "authenticated"   = aws_iam_role.cognito_authenticated.arn
    "unauthenticated" = aws_iam_role.cognito_unauthenticated.arn
  }
}

# ---------------------------------------------------------------
# AWS Cognito Authenticated Principals JSON
# ---------------------------------------------------------------
data "template_file" "cognito_principal_authenticated" {
  template = file("${path.module}/iam/cognito_principal_auth.tpl")
  vars = {
    identity_pool_id = aws_cognito_identity_pool.this.id
  }
}

# ---------------------------------------------------------------
# AWS Cognito Authenticated Role
# ---------------------------------------------------------------
resource "aws_iam_role" "cognito_authenticated" {
  depends_on = [aws_cognito_identity_pool.this]

  name               = local.authenticated_role_name
  assume_role_policy = data.template_file.cognito_principal_authenticated.rendered
}

# ---------------------------------------------------------------
# AWS Cognito Authenticated Policy JSON
# ---------------------------------------------------------------
# data "template_file" "cognito_policy_authenticated" {
#   template = "${file("${path.module}/iam/cognito_policy_auth.tpl")}"
#   vars = {
#     api_execution_arn = "${aws_api_gateway_stage.this.execution_arn}/*"
#   }
# }

resource "aws_iam_role_policy" "cognito_authenticated" {
  role = aws_iam_role.cognito_authenticated.id

  policy = file("${path.module}/iam/cognito_policy_auth.json")
}

# ---------------------------------------------------------------
# AWS Cognito UnAuthenticated Principals JSON
# ---------------------------------------------------------------
data "template_file" "cognito_principal_unauthenticated" {
  template = file("${path.module}/iam/cognito_principal_unauth.tpl")
  vars = {
    identity_pool_id = aws_cognito_identity_pool.this.id
  }
}

# ---------------------------------------------------------------
# AWS Cognito UnAuthenticated Role
# ---------------------------------------------------------------
resource "aws_iam_role" "cognito_unauthenticated" {
  depends_on = [aws_cognito_identity_pool.this]

  name               = local.unauthenticated_role_name
  assume_role_policy = data.template_file.cognito_principal_unauthenticated.rendered
}

# ---------------------------------------------------------------
# AWS Cognito UnAuthenticated Policy
# ---------------------------------------------------------------
resource "aws_iam_role_policy" "cognito_unauthenticated" {
  role = aws_iam_role.cognito_unauthenticated.id

  policy = file("${path.module}/iam/cognito_policy_unauth.json")
}

