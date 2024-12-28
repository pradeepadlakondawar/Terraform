resource "aws_instance" "web" {

  ami                         = var.ami_id
  iam_instance_profile        = var.iam_role_arn
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  security_groups             = [var.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip


  # User data to run a basic script when the instance is launched
  user_data = var.user_data

  #EBS Volume configuration (optional)
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = {
    Name = var.name
  }
}

# EBS Volume (Additional)
resource "aws_ebs_volume" "data" {
  availability_zone = var.availability_zone
  size              = var.ebs_size
  type              = "gp2"
  tags = {
    Name = "${var.name}-ebs-volume"
  }
}

resource "aws_volume_attachment" "data_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.data.id
  instance_id = aws_instance.web.id
}
