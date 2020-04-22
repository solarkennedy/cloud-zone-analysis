module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0b44050b2d893d5f7"
  region = "ap-south-1"
}
