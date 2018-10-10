

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  tags {
    Name = "kss"
    Owner = "kss"
    
  }
}

resource "aws_subnet" "public1of2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.public_cidr1of2}"
  availability_zone = "${var.availability_zone1}"
  tags {
    Name = "Public Subnet 1of2"
    Owner = "kss"
  }
}
resource "aws_subnet" "public2of2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.public_cidr2of2}"
  availability_zone = "${var.availability_zone2}"
  tags {
    Name = "Public Subnet 2of2 "
    Owner = "kss"
  }
}


resource "aws_subnet" "private" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.private_cidr}"
  availability_zone = "${var.availability_zone1}"
  tags {
    Name = "Private Subnet"
    Owner = "kss"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
  tags {
    Name = "kss"
    Owner = "kss"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "public"
    Owner = "kss"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = "${aws_nat_gateway.nat.id}"
  }
  tags {
    Name = "private"
    Owner = "kss"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.public1of2.id}"
  route_table_id = "${aws_route_table.public.id}"
}
resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.public2of2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_eip" "nat" {
  vpc      = true
  tags {
    Name = "kss"
    Owner = "kss"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public1of2.id}"
  tags {
    Name = "kss"
    Owner = "kss"
  }
}
