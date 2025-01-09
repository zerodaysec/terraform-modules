# S3 bucket for website.
resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"
  tags = var.common_tags
}

# S3 bucket for website.
resource "aws_s3_bucket" "blog_bucket" {
  bucket = "blog.${var.bucket_name}"
  tags = var.common_tags
}

# S3 bucket for redirecting non-www to www.
resource "aws_s3_bucket" "root_bucket" {
  bucket = var.bucket_name
  tags = var.common_tags
}


resource "aws_s3_bucket_website_configuration" "www_bucket" {
  bucket = aws_s3_bucket.www_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_public_access_block" "allow_public_www_bucket" {
  bucket = aws_s3_bucket.www_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_cors_configuration" "www_bucket_cors" {
  bucket = aws_s3_bucket.www_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.bucket_name}"]
    # allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_policy" "www_bucket_access" {
  bucket = aws_s3_bucket.www_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_world_www.json
}

resource "aws_s3_bucket_website_configuration" "blog_bucket" {
  bucket = aws_s3_bucket.blog_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_public_access_block" "allow_public_blog_bucket" {
  bucket = aws_s3_bucket.blog_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_cors_configuration" "blog_bucket_cors" {
  bucket = aws_s3_bucket.blog_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://blog.${var.bucket_name}"]
    # allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_policy" "blog_bucket_access" {
  bucket = aws_s3_bucket.blog_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_world_blog.json
}




resource "aws_s3_bucket_website_configuration" "root_bucket" {
  bucket = aws_s3_bucket.root_bucket.id

  redirect_all_requests_to {
    # host_name = "https://www.${var.domain_name}"
    host_name = "www.${var.domain_name}"
  }
}

resource "aws_s3_bucket_public_access_block" "allow_public_root_bucket" {
  bucket = aws_s3_bucket.root_bucket.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_cors_configuration" "root_bucket_cors" {
  bucket = aws_s3_bucket.root_bucket.id

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

resource "aws_s3_bucket_policy" "root_bucket_access" {
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
      "s3:GetObject"
    ]

    resources = [
      # aws_s3_bucket.root_bucket.arn,
      "${aws_s3_bucket.root_bucket.arn}/*",
    ]
  }
}

data "aws_iam_policy_document" "allow_access_from_world_www" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      # aws_s3_bucket.root_bucket.arn,
      "${aws_s3_bucket.www_bucket.arn}/*",
    ]
  }
}

data "aws_iam_policy_document" "allow_access_from_world_blog" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      # aws_s3_bucket.root_bucket.arn,
      "${aws_s3_bucket.blog_bucket.arn}/*",
    ]
  }
}





################### 404 file below

# data "template_file" "s3_404_page" {
#   template = "${file("${path.module}/templates/404.html.tpl")}"
#   vars = {
#     domain_name = "${var.domain_name}"
#   }
# }

# resource "aws_s3_bucket_object" "file_upload" {
#   acl           = "public-read"
#   content_type  = "text/html"
#   bucket        = aws_s3_bucket.www_bucket.bucket
#   key           = "404.html"
#   # source        = "${path.module}/templates/404.html"
#   content = data.template_file.s3_404_page.rendered
#   # etag          = "${filemd5("${path.module}/templates/404.html")}"
# }


# Move this to a check if page supplied, upload etc...

#data "template_file" "s3_index_page" {
#  template = "${file("${path.module}/templates/index.html.tpl")}"
#  vars = {
#    domain_name = "${var.domain_name}"
#  }
#}

#resource "aws_s3_bucket_object" "file_upload_index" {
#  acl           = "public-read"
#  content_type  = "text/html"
#  bucket        = aws_s3_bucket.www_bucket.bucket
#  key           = "index.html"
#  # source        = "${path.module}/templates/404.html"
#  content = data.template_file.s3_index_page.rendered
#  # etag          = "${filemd5("${path.module}/templates/404.html")}"
#}
