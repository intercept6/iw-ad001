# VPC
resource "aws_vpc" "iw-ad001VPC" {
	cidr_block = "10.0.0.0/16"
	assign_generated_ipv6_cidr_block = "true"
	instance_tenancy = "default"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
	tags {
		Name = "iw-ad001VPC"
		Project = "iw-ad001"
	}
}

# InternetGateway
resource "aws_internet_gateway" "iw-ad001GW" {
	vpc_id = "${aws_vpc.iw-ad001VPC.id}"
	tags {
		Name = "iw-ad001GW"
		Project = "iw-ad001"
	}
}

# Subnet
## Public
resource "aws_subnet" "iw-ad001Subnet_public" {
	vpc_id = "${aws_vpc.iw-ad001VPC.id}"
	cidr_block = "10.0.0.0/24"
	ipv6_cidr_block = "${cidrsubnet(aws_vpc.iw-ad001VPC.ipv6_cidr_block, 8, 0)}"
	assign_ipv6_address_on_creation = "true"
	availability_zone = "ap-northeast-1a"
	tags {
		Name = "iw-ad001Subnet_public"
		Project = "iw-ad001"
	}
}
## Private
resource "aws_subnet" "iw-ad001Subnet_private" {
	vpc_id = "${aws_vpc.iw-ad001VPC.id}"
	cidr_block = "10.0.10.0/24"
	availability_zone = "ap-northeast-1a"
	tags {
		Name = "iw-ad001Subnet_private"
		Project = "iw-ad001"
	}
}
# RouteTable
## Public
resource "aws_route_table" "iw-ad001Route_public" {
	vpc_id = "${aws_vpc.iw-ad001VPC.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.iw-ad001GW.id}"
	}
	route {
		ipv6_cidr_block = "::/0"
		gateway_id = "${aws_internet_gateway.iw-ad001GW.id}"
	}
	tags {
		Name = "iw-ad001Route_public"
		Project = "iw-ad001"
	}
}
## Private
resource "aws_route_table" "iw-ad001Route_private" {
	vpc_id = "${aws_vpc.iw-ad001VPC.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.iw-ad001GW.id}"
	}
	tags {
		Name = "iw-ad001Route_private"
		Project = "iw-ad001"
	}
}

# RouteTableAssociation
## Public
resource "aws_route_table_association" "iw-ad001Rta_public" {
	subnet_id = "${aws_subnet.iw-ad001Subnet_public.id}"
	route_table_id = "${aws_route_table.iw-ad001Route_public.id}"
}
## Private
resource "aws_route_table_association" "iw-ad001Rta_private" {
	subnet_id = "${aws_subnet.iw-ad001Subnet_private.id}"
	route_table_id = "${aws_route_table.iw-ad001Route_private.id}"
}
