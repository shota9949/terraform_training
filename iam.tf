resource "aws_iam_role" "lambda_iam_role" {
    name = "terraform_lambda_iam_role2"

    assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "lambda.amazonaws.com"
      },
        "Effect": "Allow",
        "Sid": ""
    }
    ]
    }
    POLICY
  
}

resource "aws_iam_role_policy" "lambda_access_policy" {
    name = "terraform_lamda_access_policy2"
    role = aws_iam_role.lambda_iam_role.id
    policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:CreateLogGroup",
                "logs:PutLogEvents"
        ],
        "Resource": "arn:aws:logs:*:*:*"
         }
        ]
    }
    POLICY
  
}