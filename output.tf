output "public_ip" {
  value = aws_lightsail_instance.centos_instance.public_ip_address
}