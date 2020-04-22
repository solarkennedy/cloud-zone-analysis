module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-00edfb46b107f643c"
  region = "ap-northeast-2"
}
