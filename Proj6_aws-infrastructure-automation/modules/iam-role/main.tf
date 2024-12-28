# modules/iam-role/main.tf
resource "aws_iam_role" "instance_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.role_name}-instance-profile"
  role = aws_iam_role.instance_role.name
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "instance_policy_attach" {
  role       = aws_iam_role.instance_role.name
  policy_arn = var.policy_arn
}
