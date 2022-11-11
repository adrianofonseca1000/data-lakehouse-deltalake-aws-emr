variable "aws_region" {
  default = "us-east-2"
}

variable "lambda_function_name" {
  default = "ExecutaEMR"
}

variable "key_pair_name" {
  default = "adriano-teste"
}

variable "airflow_subnet_id" {
  default = "subnet-09f7790fe695d10fe"
}

variable "vpc_id" {
  default = "vpc-08179adaab017fe5c"
}