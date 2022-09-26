output "ip" {
  value = data.http.myPublicIp.response_body
}