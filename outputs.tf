output "vm_ip_aws" {
  value = aws_instance.vm_aws.public_ip
}