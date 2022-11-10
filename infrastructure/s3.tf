resource "aws_s3_bucket" "datalake" {
  # Parametros de configuração do recurso escolhido
  bucket = "datalake-adriano-tf"
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_acl" "datalake" {
  bucket = aws_s3_bucket.datalake.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "datalake" {
  bucket = aws_s3_bucket.datalake.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


# Datalake Stream
resource "aws_s3_bucket" "stream" {
  bucket = "adriano-streaming-bucket"
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_acl" "stream" {
  bucket = aws_s3_bucket.stream.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "stream" {
  bucket = aws_s3_bucket.stream.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


# Código old - Não funciona
# resource "aws_s3_bucket" "dl" {
#   bucket = "datalake-adriano-tf"
#   acl    = "private"

#   tags = {
#     IES   = "IGTI",
#     CURSO = "EDC"
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }