resource "aws_s3_bucket" "state_bucket" {

    bucket = "terraform-remote-state-k8"
    lifecycle {
        prevent_destroy  = false
    }
    versioning {
        enabled = true
    }
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}