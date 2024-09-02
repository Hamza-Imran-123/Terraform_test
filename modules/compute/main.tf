resource "aws_instance" "this" {
  ami                         = "ami-0c55b159cbfafe1f0"
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_ids[0]
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true
}

output "instance_id" {
  value = aws_instance.this.id
}
