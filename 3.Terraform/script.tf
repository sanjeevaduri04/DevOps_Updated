# Terraform configuration for creating IAM users.
# main.tf

# Define the provider
provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

# Create an IAM user
resource "aws_iam_user" "example_user" {
  name = "example_user"
  path = "/"
}

# Create an IAM policy
resource "aws_iam_policy" "example_policy" {
  name        = "example_policy"
  path        = "/"
  description = "A test policy"
  policy      = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "s3:ListBucket",
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

# Attach the policy to the user
resource "aws_iam_user_policy_attachment" "example_user_policy_attachment" {
  user       = aws_iam_user.example_user.name
  policy_arn = aws_iam_policy.example_policy.arn
}

# Optionally, create an IAM access key for the user
resource "aws_iam_access_key" "example_user_key" {
  user    = aws_iam_user.example_user.name
}

output "user_access_key_id" {
  value = aws_iam_access_key.example_user_key.id
}

output "user_secret_access_key" {
  value = aws_iam_access_key.example_user_key.secret
  sensitive = true
}
