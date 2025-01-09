# S3 bucket for website.
resource "aws_s3_bucket" "root_bucket" {
  bucket = "${var.bucket_name}"

  tags = var.common_tags
}

resource "aws_s3_bucket_website_configuration" "root_bucket" {
  bucket = aws_s3_bucket.root_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_public_access_block" "allow_public" {
  bucket = aws_s3_bucket.root_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_cors_configuration" "root_bucket" {
  bucket = aws_s3_bucket.root_bucket.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.bucket_name}"]
    # allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_world" {
  bucket = aws_s3_bucket.root_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_world.json
}

data "aws_iam_policy_document" "allow_access_from_world" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      # aws_s3_bucket.root_bucket.arn,
      "${aws_s3_bucket.root_bucket.arn}/*",
    ]
  }
}
