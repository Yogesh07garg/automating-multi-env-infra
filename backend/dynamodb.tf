resource "aws_dynamodb_table" "my_table" {
  name           = "dynamo-db-table"
  billing_mode   = "PAY_PER_REQUEST" # On-demand pricing, no need to define read/write capacity
  hash_key       = "LockID"              # Partition key

  attribute {
    name = "LockID"
    type = "S"  # S = String, N = Number, B = Binary
  }

  
}
