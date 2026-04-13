resource "aws_s3_bucket" "bucket1" {
    bucket = local.s3-sufix   
    provider = aws.Virginia
}