module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-04fcc97b5f6edcd89"
  region = "ap-southeast-2"
}
