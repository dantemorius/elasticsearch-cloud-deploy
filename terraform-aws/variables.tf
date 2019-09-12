variable "profile" {
  description = "Default Profile"
  default = "dev-ongoing"
}
### MANDATORY ###
variable "es_cluster" {
  description = "poc-elk-logcenter"
  default = "poc-elk-logcenter"
}

variable "aws_region" {
  type = "string"
  default = "us-east-1"
}

variable "route_table_id" {
  type = "string"
  default = "rtb-8e674bf7"
}


variable "vpc_id" {
  description = "VPC ID to create the Elasticsearch cluster in"
  type = "string"
  default = "vpc-e5313b83"
}

variable "clients_subnet_ids" {
  description = "Subnets to run client nodes and client ELB in. Only one subnet per availability zone allowed. Will detect a single subnet by default." 
  type = "list"
  default = ["subnet-1e0bd556","subnet-b618f49a"]
}

variable "cluster_subnet_ids" {
  description = "Cluster nodes subnets. Defaults to all VPC subnets." 
  type = "list"
  default = ["subnet-1e0bd556","subnet-b618f49a"]
}

variable "availability_zones" {
  type = "list"
  description = "AWS region to launch servers; if not set the available zones will be detected automatically"
  default = ["us-east-1a","us-east-1d"]
}

variable "key_name" {
  description = "Key name to be used with the launched EC2 instances."
  default = "elasticsearch"
}

variable "environment" {
  default = "poc-elk"
}

variable "data_instance_type" {
  type = "string"
  default = "t2.large"
}

variable "master_instance_type" {
  type = "string"
  default = "t2.xlarge"
}

variable "elasticsearch_volume_size" {
  type = "string"
  default = "100" # gb
}

variable "volume_encryption" {
  default = true
}

variable "elasticsearch_data_dir" {
  default = "/opt/elasticsearch/data"
}

variable "elasticsearch_logs_dir" {
  default = "/var/log/elasticsearch"
}

# default elasticsearch heap size
variable "data_heap_size" {
  type = "string"
  default = "4g"
}

variable "master_heap_size" {
  type = "string"
  default = "4g"
}

variable "client_heap_size" {
  type = "string"
  default = "1g"
}

variable "masters_count" {
  default = "2"
}

variable "datas_count" {
  default = "2"
}

variable "clients_count" {
  default = "2"
}

variable "security_enabled" {
  description = "Whether or not to enable x-pack security on the cluster"
  default = "false"
}

variable "monitoring_enabled" {
  description = "Whether or not to enable x-pack monitoring on the cluster"
  default = "true"
}

# client nodes have nginx installed on them, these credentials are used for basic auth
variable "client_user" {
  default = "Overlord"
}

variable "public_facing" {
  description = "Whether or not the created cluster should be accessible from the public internet"
  type = "string"
  default = "true"
}

# the ability to add additional existing security groups. In our case
# we have consul running as agents on the box
variable "additional_security_groups" {
  type = "list"
  default = []
}

variable "ebs_optimized" {
  description = "Whether data instances are EBS optimized or not"
  default = "true"
}

variable "lb_port" {
  description = "The port the load balancer should listen on for API requests."
  default     = 80
}

variable "health_check_type" {
  description = "Controls how health checking is done. Must be one of EC2 or ELB."
  default     = "EC2"
}

variable "xpack_monitoring_host" {
  description = "ES host to send monitoring data"
  default     = "self"
}

variable "s3_backup_bucket" {
  description = "S3 bucket for backups"
  default     = "poc-elk-bkp-bucket"
}
