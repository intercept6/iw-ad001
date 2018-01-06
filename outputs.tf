# Instance_ad01
output "Instance_ad01 Address" {
	value = "${aws_instance.iw-ad001Instance_ad01.private_ip}"
}
# Instance_ad02
output "Instance_ad02 Address" {
	value = "${aws_instance.iw-ad001Instance_ad02.private_ip}"
}
# Instance_client
output "Instance_client Address" {
	value = "${aws_instance.iw-ad001Instance_client01.private_ip}"
}
# Instance_linux
output "Instance_linux Address" {
	value = "${aws_instance.iw-ad001Instance_linux.public_ip}"
}
output "Instance_linux IPv6 Address" {
	value = "${aws_instance.iw-ad001Instance_linux.ipv6_addresses}"
}

output "command" {
	value = "\n ssh -fNC -L 13389:${aws_instance.iw-ad001Instance_ad01.private_ip}:3389 -i ./iw-ad001 ec2-user@${aws_instance.iw-ad001Instance_linux.public_ip} \n ssh -fNC -L 23389:${aws_instance.iw-ad001Instance_ad02.private_ip}:3389 -i ./iw-ad001 ec2-user@${aws_instance.iw-ad001Instance_linux.public_ip} \n ssh -fNC -L 33389:${aws_instance.iw-ad001Instance_client01.private_ip}:3389 -i ./iw-ad001 ec2-user@${aws_instance.iw-ad001Instance_linux.public_ip}"
}
