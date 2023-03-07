resource "aws_key_pair" "key_pair" {
  key_name   = "aws-key"
  public_key = var.aws_pub_key
}

resource "aws_instance" "vm_aws" {

  ami                         = "ami-0dfcb1ef8550277af" # AMI = amazon machine image = é a imagem que contém as configurações do SO.
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key_pair.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id # recurso.tipo_recurso.nome_referencia.outputs.argumento
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform"
  }
}