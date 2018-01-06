# SSH KEY
resource "aws_key_pair" "iw-ad001_keypair" {

  key_name   = "iw-ad001_key_pair"
  public_key = "${var.key_pair["public_key"]}"
}

# Instance
## Instance_linux
resource "aws_instance" "iw-ad001Instance_linux" {
	ami = "${var.images_linux["ap-northeast-1"]}"
	instance_type = "t2.nano"
	key_name = "${aws_key_pair.iw-ad001_keypair.key_name}"
	user_data = "${file("linux_userdata.sh")}"
	vpc_security_group_ids = [
		"${aws_security_group.iw-ad001SecurityGroup_public.id}"
	]
	subnet_id = "${aws_subnet.iw-ad001Subnet_public.id}"
	associate_public_ip_address = "true"
	root_block_device = {
		volume_type = "gp2"
		volume_size = "40"
	}
	tags {
		Name = "iw-ad001Instance_linux"
		Project = "iw-ad001"
	}
}

## Instance_ad01
resource "aws_instance" "iw-ad001Instance_ad01" {
	ami = "${var.images_windows["ap-northeast-1"]}"
	instance_type = "t2.large"
	key_name = "${aws_key_pair.iw-ad001_keypair.key_name}"
	user_data = "${data.template_file.iw-ad001_template_file_ad01.rendered}"
	vpc_security_group_ids = [
		"${aws_security_group.iw-ad001SecurityGroup_private.id}"
	]
	subnet_id = "${aws_subnet.iw-ad001Subnet_private.id}"
	private_ip = "10.0.10.11"
	associate_public_ip_address = "true"
	root_block_device = {
		volume_type = "gp2"
		volume_size = "40"
	}
	tags {
		Name = "iw-ad001Instance_ad01"
		Project = "iw-ad001"
	}
}

## Instance_ad02
resource "aws_instance" "iw-ad001Instance_ad02" {
	ami = "${var.images_windows["ap-northeast-1"]}"
	instance_type = "t2.large"
	key_name = "${aws_key_pair.iw-ad001_keypair.key_name}"
	user_data = "${data.template_file.iw-ad001_template_file_ad02.rendered}"
	vpc_security_group_ids = [
		"${aws_security_group.iw-ad001SecurityGroup_private.id}"
	]
	subnet_id = "${aws_subnet.iw-ad001Subnet_private.id}"
	associate_public_ip_address = "true"
	private_ip = "10.0.10.12"
	root_block_device = {
		volume_type = "gp2"
		volume_size = "40"
	}
	tags {
		Name = "iw-ad001Instance_ad02"
		Project = "iw-ad001"
	}
}

## Instance_client01
resource "aws_instance" "iw-ad001Instance_client01" {
	ami = "${var.images_windows["ap-northeast-1"]}"
	instance_type = "t2.large"
	key_name = "${aws_key_pair.iw-ad001_keypair.key_name}"
	user_data = "${data.template_file.iw-ad001_template_file_client01.rendered}"
	vpc_security_group_ids = [
		"${aws_security_group.iw-ad001SecurityGroup_private.id}"
	]
	subnet_id = "${aws_subnet.iw-ad001Subnet_private.id}"
	associate_public_ip_address = "true"
	private_ip = "10.0.10.13"
	root_block_device = {
		volume_type = "gp2"
		volume_size = "40"
	}
	tags {
		Name = "iw-ad001Instance_client01"
		Project = "iw-ad001"
	}
}
