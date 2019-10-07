# ---------------------------------------------------------------
# AWS Cognito Identity Pool
# ---------------------------------------------------------------
resource "aws_cognito_identity_pool" "this" {
  depends_on = [
    "aws_cognito_user_pool.this",
  ]

  identity_pool_name               = "${local.project_name_uc}_IdentityPool"
  allow_unauthenticated_identities = false

  cognito_identity_providers {
    client_id               = "${aws_cognito_user_pool_client.this.id}"
    provider_name           = "${aws_cognito_user_pool.this.endpoint}"
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
  identity_pool_id = "${local.cognito_identity_pool_id}"

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
    "authenticated"   = "${aws_iam_role.cognito_authenticated.arn}"
    "unauthenticated" = "${aws_iam_role.cognito_unauthenticated.arn}"
  }
}


# ---------------------------------------------------------------
# AWS Cognito Authenticated Principals JSON
# ---------------------------------------------------------------
data "template_file" "cognito_authenticated" {
  template = "${file("${path.module}/iam/cognito_principal_auth.tpl")}"
  vars = {
    identity_pool_id = "${local.cognito_identity_pool_id}"
  }
}

# ---------------------------------------------------------------
# AWS Cognito Authenticated Role
# ---------------------------------------------------------------
resource "aws_iam_role" "cognito_authenticated" {
  name = "${local.project_name_uc}_Cognito_AuthRole"

  assume_role_policy = "${data.template_file.cognito_authenticated.rendered}"
}

# ---------------------------------------------------------------
# AWS Cognito Authenticated Policy
# ---------------------------------------------------------------
data "template_file" "cognito_policy_authenticated" {
  template = "${file("${path.module}/iam/cognito_policy_auth.tpl")}"
  vars = {
    api_execution_arn = "${aws_api_gateway_stage.this.execution_arn}/*"
  }
}

resource "aws_iam_role_policy" "cognito_authenticated" {
  role = "${aws_iam_role.cognito_authenticated.id}"

  policy = "${data.template_file.cognito_policy_authenticated.rendered}"
}

# ---------------------------------------------------------------
# AWS Cognito UnAuthenticated Principals JSON
# ---------------------------------------------------------------
data "template_file" "cognito_unauthenticated" {
  template = "${file("${path.module}/iam/cognito_principal_unauth.tpl")}"
  vars = {
    identity_pool_id = "${aws_cognito_identity_pool.this.id}"
  }
}

# ---------------------------------------------------------------
# AWS Cognito UnAuthenticated Role
# ---------------------------------------------------------------
resource "aws_iam_role" "cognito_unauthenticated" {
  name = "${local.project_name_uc}_Cognito_UnauthRole"

  assume_role_policy = "${data.template_file.cognito_unauthenticated.rendered}"
}

# ---------------------------------------------------------------
# AWS Cognito UnAuthenticated Policy
# ---------------------------------------------------------------
resource "aws_iam_role_policy" "cognito_unauthenticated" {
  role = "${aws_iam_role.cognito_unauthenticated.id}"

  policy = "${file("${path.module}/iam/cognito_policy_unauth.json")}"
}
