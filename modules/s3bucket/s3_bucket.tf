## S3 bucket creation Resource ##


resource "aws_s3_bucket" "data" {
  bucket = "${var.project}-${var.user-role}-${var.region}-data"
  force_destroy = true  

  tags = {
    Name        = "${var.project}-${var.user-role}-s3"
  }
}