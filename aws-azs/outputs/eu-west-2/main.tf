module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0eb89db7593b5d434"
  region = "eu-west-2"
}
