# Nat Gateway
## 001
resource "aws_nat_gateway" "iw-ad001_NatGW" {
  allocation_id = "${aws_eip.iw-ad001_EIP.id}"
  subnet_id     = "${aws_subnet.iw-ad001Subnet_public.id}"

  tags {
    Name = "NatGW001"
    Project = "iw-ad001"
  }
}
