module "latency-test" {
  source = "../../latency-test-tf-module"
  ami = "ami-0278fe6949f6b1a06"
  region = "ap-northeast-1"
}
