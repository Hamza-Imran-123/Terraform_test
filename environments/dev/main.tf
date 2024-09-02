module "networking" {
  source   = "../../modules/networking"
  vpc_cidr = "10.0.0.0/16"
}

module "compute" {
  source             = "../../modules/compute"
  vpc_id             = module.networking.vpc_id
  subnet_ids         = module.networking.subnet_ids
  instance_type      = "t2.micro"
  security_group_ids = [module.networking.security_group_id]
}

module "storage" {
  source      = "../../modules/storage"
  bucket_name = "dev-my-terraform-bucket"
}

module "iam" {
  source     = "../../modules/iam"
  iam_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
