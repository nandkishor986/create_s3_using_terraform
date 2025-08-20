output "s3_bucket_name" {
	value = aws_s3_bucket.my_bucket.bucket
}

output "aws_s3_object_name" {
	value = aws_s3_object.object.source
}