
# SecurityGroup
## public
resource "aws_security_group" "iw-ad001SecurityGroup_public" {
	name = "iw-ad001SecurityGroup_public"
	description = "iw-ad001SecurityGroup_public"
	vpc_id = "${aws_vpc.iw-ad001VPC.id}"
	ingress {
		from_port = "22"
		to_port = "22"
		protocol = "tcp"
		cidr_blocks = ["${var.myIP["ipv4"]}"]
		#ipv6_cidr_blocks = ["${var.myIP["ipv6"]}"]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}
	tags {
		Name = "iw-ad001SecurityGroup_public"
		Project = "iw-ad001"
	}
}

## private
resource "aws_security_group" "iw-ad001SecurityGroup_private" {
	name = "iw-ad001SecurityGroup_private"
	description = "iw-ad001SecurityGroup_private"
	vpc_id = "${aws_vpc.iw-ad001VPC.id}"
	ingress {
		from_port = 3389
		to_port = 3389
		protocol = "tcp"
		security_groups = ["${aws_security_group.iw-ad001SecurityGroup_public.id}"]
	}
	ingress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["${aws_subnet.iw-ad001Subnet_private.cidr_block}"]
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags {
		Name = "iw-ad001SecurityGroup_private"
		Project = "iw-ad001"
	}
}
