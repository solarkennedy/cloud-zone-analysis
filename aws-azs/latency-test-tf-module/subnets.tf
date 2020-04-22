
resource "aws_subnet" "latency-test-subnet" {
    count = length(data.aws_availability_zones.all.names)
    vpc_id = aws_vpc.latency-test-vpc.id
    cidr_block = "10.1.${count.index}.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = data.aws_availability_zones.all.names[count.index]
}
resource "aws_route_table_association" "latency-test-crta-latency-test"{
    count = length(data.aws_availability_zones.all.names)
    subnet_id = aws_subnet.latency-test-subnet[count.index].id
    route_table_id = aws_route_table.latency-test-crt.id
}
