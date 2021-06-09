data "http" "my_public_ip" {
    url = "https://api.ipify.org"
}
locals {
    ip = data.http.my_public_ip.body
}

output public_ip{
    value = local.ip
}