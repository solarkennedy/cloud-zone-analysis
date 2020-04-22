module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0f7719e8b7ba25c61"
  region = "ap-southeast-1"
}
