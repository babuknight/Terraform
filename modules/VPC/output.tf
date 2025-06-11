output "vpc_id" {
  value = aws_vpc.main.id
}

output "gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.ngw.id
}

# output "subnet_pt_id" {
#  value = "aws_subnet.subnet_pt.id"
# }

output "subnet_id_pb" {
  value = aws_subnet.public.id
}

output "allocation_id" {
  value = aws_eip.nat.id
}

output "ngw_id" {
  value = aws_nat_gateway.ngw.id
}