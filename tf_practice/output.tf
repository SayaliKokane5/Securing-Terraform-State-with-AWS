output "aws_ec2_instance_ip" {
  value = {
    for key, instance in aws_instance.my_instance : key => instance.public_ip
  }
}