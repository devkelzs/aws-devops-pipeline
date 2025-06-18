output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}

output "web_ip" {
  value = aws_instance.web.public_ip
}

