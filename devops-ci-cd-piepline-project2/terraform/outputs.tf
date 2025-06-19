output "instance_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web_server.public_ip
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.web_server.id
}
